/// Marks the exception not to be sent to Crashlytics.
///
/// Override [isSilent] to conditionally suppress reporting
/// (e.g., only for specific error codes). The default implementation
/// always returns `true`.
abstract class SilentException {
  const SilentException();

  /// Returns true if this type of the exception should not be sent to
  /// Crashlytics.
  bool get isSilent => true;
}
