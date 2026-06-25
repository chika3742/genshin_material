import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:url_launcher/url_launcher.dart" as u;
import "package:url_launcher/url_launcher_string.dart" as us;

part "launch_url.g.dart";

typedef LaunchUrl = Future<bool> Function(
  Uri url, {
  u.LaunchMode mode,
});

typedef LaunchUrlString = Future<bool> Function(
  String url, {
  u.LaunchMode mode,
});

@riverpod
LaunchUrl launchUrl(Ref ref) {
  return u.launchUrl;
}

@riverpod
LaunchUrlString launchUrlString(Ref ref) {
  return us.launchUrlString;
}
