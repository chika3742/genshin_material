# Review criteria

## What counts as a failure in this repository

A change fails when it:

- crashes, or shows the user wrong data for inputs it is meant to handle
- loses or corrupts data in the local Drift database, for example through a schema change without a migration
- exposes HoYoLAB credentials, such as cookies, in logs, error messages, or requests to other hosts
- breaks the remote asset update, leaving the app without game data
- runs work that a Remote Config kill switch has turned off, or uses Firebase where it may be unavailable
- breaks a rule in `CLAUDE.md` whose violation breaks something. Find the rule text in `CLAUDE.md` and quote it.

## Severity

- **Important:** any failure above. It needs a concrete scenario (which input or state leads to which wrong outcome), or a quoted rule.
- **Nit:** a convention in `CLAUDE.md` that the analyzer does not enforce, broken without changing behavior. Documentation or comments that no longer match the code are also Nits.
- Report at most five Nits per review. Keep the ones the author would most want to fix.
- Never report style, naming, or refactoring preferences that `CLAUDE.md` does not back.

## Evidence

- Every finding cites the `file:line` where the problem is.
- A claim about how code behaves cites the code that makes it so. A name is not evidence of behavior.
- A claim about how a dependency or the framework behaves cites that dependency's source.
- A rule finding quotes the rule and names the file it is in.

## Do not report

Finders skip these two categories:

- Anything `fvm flutter analyze` reports, such as lint warnings, type errors, unused imports, and formatting. CI runs it.
- Generated files, unless changing them is the point of the pull request: `*.g.dart`, `*.freezed.dart`, `*.mocks.dart`, `*.g.kt`, `*.g.swift`, `drift_schemas/`, `test/drift/db/generated/`, and `pubspec.lock`.

The verify and rank steps also drop these:

- Missing tests or coverage, unless `CLAUDE.md` requires them for the change
- Code that looks wrong but is correct
- Behavior the pull request states is intended, unless it causes a failure listed above
- Issues silenced in the code on purpose, such as with an `// ignore:` comment
- Issues already raised in the comments or reviews on this pull request
