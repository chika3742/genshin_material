# CLAUDE.md

## Commands

- Prefix every `flutter` / `dart` command with `fvm` (e.g. `fvm flutter test`).
- `./scripts/coverage.sh` runs all tests and prints a per-directory coverage summary (requires lcov).
- Generated files are committed. After editing their sources, regenerate with `fvm dart run slang` (`.i18n.yaml`), `fvm dart run pigeon --input ./pigeon.dart` (`pigeon.dart`), or `fvm dart run build_runner build` (everything else: freezed, riverpod, go_router, json_serializable, drift, mockito).
- When incrementing the Drift `schemaVersion`, run `fvm dart run drift_dev make-migrations`, commit the snapshots in `drift_schemas/db/`, and update `test/drift/db/migration_test.dart`.

## Architecture

- Game data is **not bundled**: it is downloaded at runtime from the asset server, and `AssetData` (from `assetDataProvider`) is its canonical in-memory form. `dataSchemaVersion` in `lib/models/common.dart` must match the remote asset schema version.
- Strings live in `lib/i18n/{ja,en}.i18n.yaml` and are accessed as `tr.<key>`. The base locale is `ja`; add every key to both files.

### Firebase

- Non-`prod` flavors start without the Firebase config files, so Firebase may be unavailable anywhere in the app. Access it through providers in general, and check that `Firebase.apps` is not empty before using a Firebase API instance directly.
- Remote Config is read only through `RemoteConfigService`: never use `FirebaseRemoteConfig.instance` except to construct the service in `main.dart`. Widgets and providers read a value with `remoteConfigProvider(key)`; classes without a `Ref` take the value itself as an argument (as `AssetUpdater.checkForUpdate` takes `minimumSchemaVersion`), not a Remote Config object.
- A kill switch is a precondition, not a value: evaluate it in the provider that hands out the service (as `_ensureLinkEnabled` does in `lib/providers/hoyolab_api.dart`), and never pass it into the class.

### HoYoLAB

- Obtain the API classes in `lib/data/services/hoyolab/` only from the providers in `lib/providers/hoyolab_api.dart`. Calls are throttled through the shared `ApiRequestQueue` unless sent with `send(useQueue: false)`.
- Time-dependent code (the DS token timestamp, `ApiRequestQueue` throttling) reads `clock.now()` from `package:clock` rather than `DateTime.now()`, so tests can pin it.

## Code Conventions

- Style (enforced by linter): double quotes, trailing commas on multi-line argument lists, `final` locals, relative imports within `lib/`, `Future<void>` (not `void`) for async functions.
- All type IDs (character, weapon, material, etc.) are `typedef` aliases over `String` in `lib/models/common.dart`. Use the specific typedef rather than raw `String` in signatures.
- Freezed `copyWith`, `map`, and `when` are disabled globally in `build.yaml`; enable one per class with `@Freezed(copyWith: true, ...)` only when needed.
- Branch on `kDevFlavor` / `kProdFlavor` (`lib/constants/flavors.dart`), not `kReleaseMode`: debug builds of `prod` and release builds of `dev` both exist.

## Testing

- Layout: `test/unit/` for everything but widgets, including `lib/core/`, `lib/data/`, and the pure helpers in `lib/db/` (an in-memory `AppDatabase` fixture is fine there); `test/drift/db/` only when `lib/db/` itself (extension methods, migrations) is the subject; `test/widget/components/` for reusable components, `test/widget/pages/` for pages and page-specific components.
- Check `test/utils/` and `test/widget/utils.dart` for a helper before writing one. When extending `test/utils/asset_data.dart`, only add optional parameters.
- Test and `group` names may be Japanese or English, but must be consistent within a file.
- **Do not hard-code locale-dependent strings.** `LocaleSettings` defaults to `ja`; assert against `tr.*` or a widget `Key` instead.
- Database: `createTestDatabase()` in `setUp`, `close()` in `tearDown`.
- Providers: `createTestContainer()`. Widgets: wrap in `createProviderScope()` (`test/widget/utils.dart`), not a bare `ProviderScope`.
- Prefs: `overridePref(key, value)` instead of setting up `SharedPreferences`. `createProviderScope()` already puts every pref at its default, so override only the prefs the test depends on and never pass `overridePrefDefaults()` to it (Riverpod rejects overriding a family twice).
- Remote Config: `overrideRemoteConfig(key, value)`, except `hoyolabLinkEnabled` under `createProviderScope()`, which already overrides it: set it through its argument instead (Riverpod rejects overriding the same provider twice). Only a test whose subject reaches the service itself needs `createRemoteConfigServiceMock()`.
- Call `setUpSecureStorageMock()` in the body of `main()` or `group()`, never inside a test or `setUp()`.
- Never use real character IDs; use placeholders such as `char_1`.
- Tests run as the `dev` flavor, and the flavor constants are compile-time. Build expected values from them (e.g. `assetReleasesUrl`) instead of hard-coding a channel.
- Pin time with `withClock` and await drift query streams with `createStreamQueue()`, rather than waiting on real durations or fixed delays.

## Editing This File

This file is loaded in full into every agent session. Keep only what an agent cannot learn from a quick read of the code and would get wrong without being told.

Update it in the same change that renames, moves, or deletes a path, symbol, or script mentioned here; adds a command, code generator, or setup step; or introduces a rule that breaks something when ignored (give the reason in one line). Also add a rule when an agent keeps making the same mistake.

Do not write:

- What a quick look at the code reveals: file listings, what a class does, which packages are used.
- Rules the analyzer enforces, beyond the one-line style summary above.
- Counts, specific values, or "currently only X". State the rule instead.
- The same fact in two places, generic advice, personal or local setup, or secrets.
