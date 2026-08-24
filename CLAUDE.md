# CLAUDE.md

This file provides guidance to coding agents when working with code in this repository.

Unless there's a specific reason to do otherwise (such as a simple bulk find-and-replace), always use the Read and Write tools for reading and writing files instead of the command line.

## Commands

```bash
# Install dependencies
fvm flutter pub get

# Lint
fvm flutter analyze

# Run all tests
fvm flutter test

# Run a single test file
fvm flutter test test/unit/utils_test.dart

# Code generation (Freezed, Riverpod, go_router, Drift, mockito mocks)
./scripts/build_runner.sh

# Slang (localization) code generation
./scripts/slang.sh

# Update Pigeon platform channel code
./scripts/run_pigeon.sh

# Database migrations (after modifying database.dart)
fvm dart run drift_dev make-migrations
```

> All `flutter` commands must be prefixed with `fvm`.

## Architecture

### Layering

```
lib/
  data/repositories/  Wrappers over external state stores (Remote Config, secure storage)
  data/services/      Wrappers over external I/O (HoYoLAB API, local notifications, url_launcher)
  use_cases/          Single-purpose application logic spanning repositories/services/db
  view_models/        Per-screen state derived from db + assets
  providers/          Cross-cutting Riverpod providers (db, prefs, assets, sync, credentials)
  composables/        flutter_hooks-based reusable widget logic (`useXxx`)
  core/               App-wide infrastructure (asset pipeline, errors, keys, theme)
  pages/, components/ UI
  db/                 Drift query extension methods
  models/             Freezed/JSON models
```

Repositories, services, use cases, and view models each declare their own `@riverpod` factory in the same file — provider declarations are colocated with the class they expose, not centralized.

### Data Flow: Remote Assets

Game data (characters, weapons, materials, artifacts, furnishings) is **not bundled** with the app. It is fetched at runtime from a remote asset server (`matnote-assets.chikach.net`) and stored locally.

- `AssetUpdater` (`lib/core/asset_updater.dart`) checks for updates against a release index, downloads zip archives, extracts them, and atomically swaps a symlink at `<applicationSupportDir>/assets/current` to point to the new version.
- `AssetLoader` (`lib/core/asset_loader.dart`) reads JSON files from the current asset directory.
- `AssetDataCacheProvider` (`lib/core/asset_cache.dart`) orchestrates loading all JSON files into a single `AssetData` freezed struct, which is the canonical in-memory representation of all game data.
- The Riverpod provider `assetDataProvider` (`lib/providers/versions.dart`) exposes `AssetData` to the widget tree.
- The `ASSET_CHANNEL` build environment variable (default: `"dev"` in debug, `"prod"` in release) controls which release channel is fetched.
- `dataSchemaVersion` in `lib/models/common.dart` must match the remote asset schema version; mismatches throw `SchemaVersionMismatchException`.
- Image files are resolved through `assetImageResolver` (`lib/providers/asset_image_resolver.dart`), never by joining asset paths by hand.

### Data Flow: Widget Access to Assets

Pages that need game data are wrapped in `DataAssetScope` (`lib/components/data_asset_scope.dart`). This widget watches `assetDataProvider` and shows a loading/error state until assets are ready, then passes `AssetData` into its `builder` callback. All data-dependent pages follow this pattern via `routes.dart`.

### State Management

- **Riverpod 3** with code generation. Provider functions take a plain `Ref` (no generic type argument).
- Widget state uses `flutter_hooks` via `HookConsumerWidget` / `HookWidget`. Reusable hook logic lives in `lib/composables/`.
- Providers that need runtime-constructed dependencies are declared to `throw StateError` and are overridden in `main.dart`'s `ProviderScope`: `sharedPreferencesWithCacheProvider`, `localNotificationProvider`, `isHoyolabSignedInInitialProvider`. When adding such a provider, override it in `main.dart` **and** in tests.
- `ProviderErrorObserver` (`lib/core/provider_error_observer.dart`) logs provider errors globally.
- Database is accessed via `appDatabaseProvider`; all complex queries are implemented as extension methods in `lib/db/`.

### Preferences

- Typed keys are declared in `PrefKeys` (`lib/core/pref_keys.dart`) using the `PrefKey` subclasses in `lib/models/pref_key.dart` (`BooleanPrefKey`, `EnumPrefKey`, `TimeOfDayPrefKey`, …), which also carry the default value and the stored↔runtime conversion.
- Read/write via `ref.watch(prefProvider(PrefKeys.xxx))` / `ref.read(prefProvider(PrefKeys.xxx).notifier).set(...)`. Never touch `SharedPreferences` directly.

### Remote Config

- `RemoteConfig` (`lib/data/services/remote_config.dart`) wraps `FirebaseRemoteConfig`; access it via `remoteConfigProvider`.
- Keys are typed constants in `RemoteConfigKeys` (`lib/core/remote_config_keys.dart`), read with `ref.watch(remoteConfigValueProvider(RemoteConfigKeys.xxx))` (`lib/data/repositories/remote_config_value.dart`) — never call `remoteConfigProvider.get()` from consumers. Defaults for keys that gate features go in `RemoteConfigKeys.defaults`.
- In tests, stub individual keys with `remoteConfigValueProvider(RemoteConfigKeys.xxx).overrideWithValue(...)`.

### Database (Drift)

- Schema is defined in `lib/database.dart` (`AppDatabase`, current version: 4).
- Row classes use `@UseRowClass` with freezed classes or `@DataClassName.custom` with sealed base classes.
- Extension methods per table type live in `lib/db/` (e.g., `bookmark_db_extension.dart`).
- Migration tests live in `test/drift/db/migration_test.dart`, plus per-step tests (e.g. `migration_v3_v4_test.dart`). Always update these when incrementing `schemaVersion`.
- Schema snapshots in `drift_schemas/db/` and the generated `test/drift/db/generated/` helpers are produced by `drift_dev make-migrations` and must be committed.

### Routing

- GoRouter with typed routes and code generation (`@TypedGoRoute`, `@TypedStatefulShellRoute`). Route data classes are `extends GoRouteData with $XxxRoute`.
- The full route tree is declared in `lib/routes.dart`; `routes.g.dart` is generated.
- The shell has five tabs: Bookmarks, Database, Daily, Tools, More.
- Routes that require assets wrap their page in `DataAssetScope`.

### HoYoLAB Integration

- `lib/data/services/hoyolab_api/hoyolab_api.dart` communicates with HoYoLAB endpoints to sync in-game state (character levels, weapon states, material bag counts, resin). The API is split by auth level: `HoyolabApi` (base) → `HoyolabPreAuthApi` (server lookup, token verification) → `HoyolabAuthenticatedApi` → `HoyolabAuthenticatedServerApi` (needs region + UID).
- Obtain instances via `hoyolabPreAuthApiProvider` / `hoyolabAuthenticatedApiProvider` / `hoyolabAuthenticatedServerApiProvider`. These throw `HoyolabLinkDisabledException` / `HoyolabUnauthenticatedException` / `HoyolabServerNotSelectedException` (all `SilentException`) when preconditions are unmet, so callers do not re-check the gates themselves.
- All API calls are serialized through `ApiRequestQueue` (`hoyolab_api_internal_utils.dart`, 500ms minimum interval between calls).
- The feature is gated by Remote Config key `RemoteConfigKeys.hoyolabLinkEnabled`.
- The cookie is stored via `SecureStorageRepository` (`lib/data/repositories/secure_storage_repository.dart`). Sign-in goes through the `StoreHoyolabCredential` use case (verify, then persist); sign-out through `hoyolabCredentialProvider.clear()`.
- Sign-in state is `isHoyolabSignedInProvider` (seeded synchronously at startup by `isHoyolabSignedInInitialProvider`); linked-and-usable state is `isHoyolabLinkAvailableProvider`.
- On iOS/macOS, item images are replaced by a blank image unless the user has linked with HoYoLAB (`shouldHideImagesProvider` in `lib/providers/miscellaneous.dart`).
- `HoyolabIntegrationApi` in `pigeon.dart` defines the platform channel used to retrieve cookies from the native WebView sign-in flow.

### Local Notifications

- `LocalNotification` (`lib/data/services/local_notification.dart`) wraps `flutter_local_notifications` + `timezone`; it is constructed in `main.dart` and injected via `localNotificationProvider`.
- Daily-material reminders are rescheduled by the `RescheduleDailyMaterialNotifications` use case, which cancels all 7 weekday slots first so the schedule stays idempotent. It is triggered from the widget tree by `useNotificationRescheduleListener`.
- Time-dependent logic uses `package:clock` (`clock.now()`) so tests can fake the clock.

### Internationalization (slang)

- Source files: `lib/i18n/ja.i18n.yaml` and `lib/i18n/en.i18n.yaml`.
- Generated accessor: `tr.<key>` (e.g., `tr.appName`).
- After editing `.i18n.yaml` files, run `./scripts/slang.sh`.

### Testing

- `test/unit/` mirrors the `lib/` layout (e.g. `test/unit/use_cases/`, `test/unit/data/services/`), `test/widget/` for widget and hook tests, `test/drift/` for database and migration tests.
- Shared helpers live in `test/utils/`.
- Mocks use mockito's `@GenerateNiceMocks`; the `.mocks.dart` files are generated by `./scripts/build_runner.sh` and committed.

## Code Generation

Generated files are committed to the repo. After any of the following changes, run `./scripts/build_runner.sh` (or `./scripts/slang.sh` for i18n):

| Change                                                  | Generator |
|---------------------------------------------------------|-----------|
| Add/edit `@freezed` class                               | freezed |
| Add/edit `@riverpod` provider                           | riverpod_generator |
| Add/edit GoRoute annotations                            | go_router_builder |
| Add/edit Drift tables                                   | drift_dev |
| Add/edit `@GenerateMocks`/`@GenerateNiceMocks` in tests | mockito |
| Edit `pigeon.dart`                                      | pigeon (via `./scripts/run_pigeon.sh`) |
| Edit `.i18n.yaml` files                                 | slang (via `./scripts/slang.sh`) |

`build.yaml` configures Freezed to disable `copyWith`, `map`, and `when` globally. Override per-class with `@Freezed(copyWith: true, ...)` if needed.

## Code Conventions

- **Double quotes** for all strings.
- **Trailing commas** required on all multi-line argument lists (enforced by the `better_require_trailing_commas` analyzer plugin).
- **`final`** for all fields and local variables where possible.
- **Relative imports** within the package (`prefer_relative_imports`), ordered per `directives_ordering`.
- **`avoid_void_async`**: never use `void` as the return type of an async function; use `Future<void>` (`main` is exempt).
- All type IDs (character, weapon, material, etc.) are `typedef` aliases over `String`, defined in `lib/models/common.dart`. Use the specific typedef rather than raw `String` in signatures.
- Models use sealed freezed classes. Do not add `copyWith`, `map`, or `when` unless overriding the global `build.yaml` config intentionally.
- Prefer sealed class hierarchies + exhaustive `switch` over stringly-typed keys (see `PrefKey`, `RemoteConfigKey`).
- `@immutable` is applied to all GoRoute data classes.
- Comments and docs are written in English.

## Firebase

Firebase options (`firebase_options.dart`) are `.gitignore`d. The app requires Firebase to be configured before building. Required services: **Crashlytics**, **Remote Config**.
