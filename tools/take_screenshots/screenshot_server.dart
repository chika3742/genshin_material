import "dart:async";
import "dart:convert";
import "dart:io";

import "package:http/http.dart" as http;
import "package:path/path.dart" as p;

/// Host-side HTTP server that captures a screenshot of the device under test
/// whenever the on-device test asks for one.
///
/// Started in-process by `take_screenshots.dart`; the on-device test only uses
/// [sendScreenshotRequest].
class ScreenshotServer {
  final String clientOs;
  final String screenshotDir;
  final String screenshotNameFormat;
  final String deviceId;

  ScreenshotServer(
    this.clientOs,
    this.screenshotDir,
    this.screenshotNameFormat,
    this.deviceId,
  );

  static const port = 51237;

  HttpServer? _server;

  /// Binds the server and starts serving in the background.
  Future<void> listen() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    _server = server;
    unawaited(_serve(server));
  }

  Future<void> close() async {
    await _server?.close(force: true);
    _server = null;
  }

  Future<void> _serve(HttpServer server) async {
    await for (final req in server) {
      if (req.uri.path != "/capture" || req.method != "POST") {
        req.response.statusCode = 404;
        await req.response.close();
        continue;
      }
      try {
        final body = await utf8.decoder.bind(req).join();
        final json = jsonDecode(body);
        final index = json["index"] as String;
        await takeScreenshot(index);
        req.response.statusCode = 200;
      } catch (e) {
        stderr.writeln(e);
        req.response.statusCode = 500;
      } finally {
        await req.response.close();
      }
    }
  }

  Future<void> takeScreenshot(String index) async {
    final screenshotFileName = screenshotNameFormat.replaceAll("{index}", index);
    final screenshotPath = p.join(screenshotDir, screenshotFileName);
    stdout.writeln("Saving screenshot to $screenshotPath");

    switch (clientOs) {
      case "android":
        final result = await Process.run("adb", ["-s", deviceId, "exec-out", "screencap", "-p"], stdoutEncoding: null);
        if (result.exitCode != 0) {
          throw "adb exited with non-zero code ${result.exitCode}: ${result.stderr}";
        }
        await File(screenshotPath).writeAsBytes(result.stdout as List<int>);
      case "ios":
        // retake if the Dynamic Island is showing up
        for (int i = 0; i < 3; i++) {
          final result = await Process.run("xcrun", ["simctl", "io", deviceId, "screenshot", screenshotPath]);
          if (result.exitCode != 0) {
            throw "xcrun exited with non-zero code ${result.exitCode}: ${result.stderr}";
          }
          // verify the image
          final widthResult = await Process.run("magick", [screenshotPath, "-format", "%w", "info:"]);
          if (widthResult.exitCode != 0) {
            throw "magick exited with non-zero exit code: ${widthResult.exitCode}. \n\n${widthResult.stderr}";
          }
          final verificationResult = await Process.run("magick", [screenshotPath, "-crop", "1x1+${int.parse(widthResult.stdout.toString().trim()) ~/ 2}+60", "-format", "%[hex:p{0,0}]", "-alpha", "off", "info:"]);
          if (verificationResult.exitCode != 0) {
            throw "magick exited with non-zero exit code: ${verificationResult.exitCode}. \n\n${verificationResult.stderr}";
          }
          if (verificationResult.stdout.toString().trim() != "000000") {
            return;
          }
          stdout.writeln("Retaking because the Dynamic Island is included");
        }
        throw "Failed to take a screenshot in 3 attempts";
      default:
        throw UnsupportedError("Unsupported platform");
    }
  }

  static Future<void> sendScreenshotRequest(String index) async {
    var host = "localhost";
    if (Platform.isAndroid) {
      host = "10.0.2.2";
    }
    final result = await http.post(Uri.parse("http://$host:$port/capture"), body: jsonEncode({"index": index}));
    if (result.statusCode ~/ 100 != 2) {
      throw "Screenshot server returned non-OK status code: ${result.statusCode}";
    }
  }
}
