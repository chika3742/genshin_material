import "package:genshin_material/providers/login_bonus_state.dart";

/// A [LoginBonusState] whose build returns whatever [onBuild] gives, so a test
/// decides between data, loading and error, and can count the builds.
///
/// Override with `loginBonusStateProvider.overrideWith(() => FakeLoginBonusState(...))`.
/// `createProviderScope` and `createTestContainer` disable retry, so an error
/// is not retried.
class FakeLoginBonusState extends LoginBonusState {
  FakeLoginBonusState(this.onBuild);

  final Future<bool?> Function() onBuild;

  @override
  Future<bool?> build() => onBuild();
}
