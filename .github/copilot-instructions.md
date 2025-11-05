# Copilot Instructions for genshin_material

## Project Overview

This is a Flutter mobile application for Genshin Impact that provides a material bookmark and database system to help players track their in-game materials, characters, weapons, artifacts, and furnishings. The app integrates with HoYoLAB APIs for game data synchronization.

## Technology Stack

### Core Technologies
- **Flutter 3.35.1**: Cross-platform mobile development framework (iOS and Android)
- **Dart 3.8.0+**: Programming language
- **Firebase**: Backend services (Crashlytics, Remote Config)

### State Management & Architecture
- **Riverpod 3.0.3**: State management with code generation
- **hooks_riverpod**: Riverpod integration library for `flutter_hooks`
- **go_router 16.3.0**: Declarative routing with code generation

### Database & Persistence
- **Drift 2.29.0**: Type-safe SQL database with SQLite
- **shared_preferences**: Key-value storage
- **flutter_secure_storage**: Secure storage for sensitive data

### Code Generation
- **freezed 3.2.3**: Immutable data classes and union types
- **json_serializable 6.11.1**: JSON serialization
- **build_runner 2.7.1**: Code generation orchestrator
- **pigeon 26.0.3**: Platform channel code generation

### Internationalization
- **slang 4.9.2**: Type-safe i18n with code generation
- **Base locale**: Japanese (ja)
- Configuration: `slang.yaml`

### UI Components
- **material_symbols_icons**: Material Design icons
- **google_fonts**: Custom fonts
- **animations**: Advanced UI animations
- **flutter_svg**: SVG rendering
- **tutorial_coach_mark**: Tutorial/onboarding overlays

### Additional Libraries
- **http**: Network requests
- **url_launcher**: Opening URLs
- **webview_flutter**: Embedded web views
- **package_info_plus**: App version info
- **path_provider**: File system paths

## Project Structure

```
lib/
├── components/          # Reusable UI components
├── composables/         # Reusable hooks and composables
├── constants/           # App constants and remote config keys
├── core/               # Core utilities (asset cache, theme, errors)
├── database.dart       # Drift database definition
├── db/                 # Database extensions
├── i18n/              # Internationalization files (.i18n.yaml)
├── main.dart          # App entry point
├── models/            # Data models (with freezed, json_serializable)
├── pages/             # Screen/page widgets
├── pigeon.g.dart      # Platform channel code
├── providers/         # Riverpod providers
├── routes.dart        # GoRouter configuration
└── ui_core/           # Core UI utilities

packages/
└── timelines/         # Custom local package for timeline UI

test/
├── drift/             # Database migration tests
├── unit/              # Unit tests
└── widget/            # Widget tests

integration_test/      # Integration tests

scripts/               # Utility scripts
```

## Code Generation

This project uses extensive code generation. Generated files include:
- `*.g.dart` - JSON serialization, Riverpod providers, go_router routes
- `*.freezed.dart` - Freezed data classes
- `*.steps.dart` - Drift database schema migrations

### Running Code Generation

```bash
# Generate all code
./scripts/codegen.sh

# Watch mode for continuous generation
./scripts/watch_codegen.sh
```

## Development Setup

### Initial Setup
```bash
# Install FVM for version management
curl -fsSL https://fvm.app/install.sh | bash

# Install Flutter SDK using FVM
fvm install

# Install dependencies
fvm flutter pub get
```

### Running the App
```bash
# Development mode
fvm flutter run
```

## Testing & Linting

### Linting
```bash
# Standard Flutter analysis
fvm flutter analyze

# Custom linting rules
fvm dart run custom_lint
```

### Testing
```bash
# Run all tests
fvm flutter test

# Run specific test file
fvm flutter test test/unit/utils_test.dart

# Integration tests
fvm flutter test integration_test/
```

### CI/CD
- GitHub Actions runs tests and linting on push/PR
- Workflow: `.github/workflows/test.yaml`
- Uses custom action: `chika3742/setup-fvm@v3`

## Coding Conventions

### Style Guidelines
- **Double quotes** for strings (`prefer_double_quotes`)
- **Final fields and locals** when possible (`prefer_final_fields`, `prefer_final_locals`)
- **Return types** must be declared (`always_declare_return_types`)
- **Relative imports** preferred (`prefer_relative_imports`)
- **Trailing commas** required (custom lint rule)
- **EOL at end of files** (`eol_at_end_of_file`)
- **Directives ordering** enforced (`directives_ordering`)
- **Avoid void async** (`avoid_void_async`)

### Analysis Configuration
See `analysis_options.yaml` for complete linting rules. Generated files (`.g.dart`, `.freezed.dart`) are excluded from analysis.

### Database Schema
- Drift database is defined in `lib/database.dart`
- Schema migrations are tested in `test/drift/db/migration_test.dart`
- Use data class names for companions (`use_data_class_name_for_companions: true`)

### Freezed Configuration
- Copy-with: disabled
- Map: disabled
- When: disabled
(See `build.yaml`)

## State Management Patterns

### Riverpod Providers
- Use `@riverpod` annotation for code generation
- Providers are generated as `*Provider` classes
- Keep providers in `lib/providers/` directory

### Database Access
- Access via `databaseProvider`
- Use extension methods in `lib/db/` for complex queries
- Database is lazy-loaded and persisted

## Asset Management

### Assets
```
assets/
├── google_fonts/      # Custom font files
├── img/              # Images
└── vectors/          # SVG files
```

### Asset Updates
- Asset versioning system with remote updates
- Configuration via Firebase Remote Config
- Asset channels: `dev` and `prod`

## Platform-Specific Notes

### iOS/macOS
- Images may be disabled when not linked with HoYoLAB
- Check `disableImages` flag in `main.dart`

### Firebase
- **Important**: Firebase options file is ignored in git
- Required services: Crashlytics, Remote Config

## Common Tasks

### Adding a New Model

#### Snippet without JSON serialization
```Dart
@freezed
sealed class <ClassName> with _$<ClassName> {
  const factory <ClassName>({
    // fields
  }) = _<ClassName>;
}
```

#### Snippet with JSON serialization
```Dart
@freezed
sealed class <ClassName> with _$<ClassName> {
  const factory <ClassName>({
    // fields
  }) = _<ClassName>;
  
  factory <ClassName>.fromJson(Map<String, dynamic> json) =>
      _$<ClassName>FromJson(json);
}
```

Make sure the file imports `package:freezed_annotation/freezed_annotation.dart` and contains part statement `part "filename.freezed.dart";`. If using JSON serialization, `part "filename.g.dart";` is also needed.

### Adding a New Page/Route
1. Create page widget in `lib/pages/`
2. Add route to `lib/routes.dart` with `@TypedGoRoute`
3. Run code generation to update routes

### Adding Translations
1. Edit appropriate `.i18n.yaml` file in `lib/i18n/`
2. Run code generation
3. Use via `tr.yourKey` in code

### Database Migrations
1. Modify tables in `lib/database.dart`
2. Increment `schemaVersion`
3. Generate migrations with `fvm dart run drift_dev make-migrations`
4. Add migration logic in `onUpgrade`
5. Add tests in `test/drift/db/migration_test.dart`

## Security Considerations

- **Never commit** Firebase options or API keys
- Use `flutter_secure_storage` for sensitive data
- HoYoLAB credentials stored securely
- Firebase Crashlytics enabled for error tracking

## Performance Notes

- Use lazy loading for database and heavy assets
- Images cached via asset cache system
- Remote config cached locally
- Optimize list rendering with proper keys

## Dependencies Management

- Use `fvm flutter pub upgrade` to update dependencies
- Check outdated: `fvm flutter pub outdated`
- Dependabot configured for automatic updates
- Pin versions in `pubspec.yaml` for stability

## Debugging

- DevTools options: `devtools_options.yaml`
- Database viewer available via `drift_db_viewer`
- Crashlytics for production crash reports
- Use `kDebugMode` and `kReleaseMode` flags for environment-specific code

## Contributing Guidelines

1. Follow existing code style and conventions
2. Run linting and tests before committing
3. Include trailing commas on all function calls
4. Use relative imports within the project
5. Update tests for any behavior changes
6. Keep generated files in sync (run build_runner)
