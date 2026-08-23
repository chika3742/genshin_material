#!/usr/bin/env -S fvm dart

import "dart:async";
import "dart:convert";
import "dart:io";

import "package:args/args.dart";
import "package:path/path.dart" as p;

import "screenshot_server.dart";

/// A device to take screenshots on.
///
/// [name] is the AVD name on Android and the simulator name on iOS.
/// [dir] is relative to this file and may contain a `{locale}` placeholder.
/// [type] is the App Store display type, used in the file name (iOS only).
typedef Device = ({String name, String dir, String? type});

const androidDevices = <Device>[
  (
    name: "Pixel_9",
    dir: "../../android/fastlane/metadata/android/{locale}/images/phoneScreenshots",
    type: null,
  ),
  (
    name: "7-inch_Tablet",
    dir: "../../android/fastlane/metadata/android/{locale}/images/sevenInchScreenshots",
    type: null,
  ),
  (
    name: "Medium_Tablet",
    dir: "../../android/fastlane/metadata/android/{locale}/images/tenInchScreenshots",
    type: null,
  ),
];

const iosDevices = <Device>[
  (
    name: "iPhone 14 Plus",
    dir: "../../ios/fastlane/screenshots/{locale}",
    type: "APP_IPHONE_65",
  ),
  (
    name: "iPad Pro 13-inch (M5)",
    dir: "../../ios/fastlane/screenshots/{locale}",
    type: "APP_IPAD_PRO_3GEN_129",
  ),
];

const androidLocales = ["ja-JP", "en-US"];
const iosLocales = ["ja", "en-US"];

const emulatorPort = 5580;
const emulatorSerial = "emulator-$emulatorPort";

final toolDir = p.dirname(p.fromUri(Platform.script));
final projectRoot = p.normalize(p.join(toolDir, "../.."));

/// Cleanup callback of the device currently booted, if any.
Future<void> Function()? _shutdownDevice;
ScreenshotServer? _server;

void main(List<String> args) async {
  if (!Platform.isMacOS) {
    throw UnsupportedError("Only macOS hosts are supported");
  }

  ArgParser buildArgParser(Iterable<String>? availableDevices, Iterable<String>? availableLocales) {
    return ArgParser()
      ..addMultiOption(
        "device",
        abbr: "d",
        help: "Only run on the devices with these names (default: all).",
        allowed: availableDevices,
      )
      ..addMultiOption(
        "locale",
        abbr: "l",
        help: "Locales to take screenshots for (default: all).",
        allowed: availableLocales,
      );
  }

  final parser = ArgParser()
    ..addCommand("android", buildArgParser(androidDevices.map((e) => e.name), androidLocales))
    ..addCommand("ios", buildArgParser(iosDevices.map((e) => e.name), iosLocales))
    ..addFlag("help", abbr: "h", negatable: false);

  final parsed = parser.parse(args);
  final platform = parsed.command?.name;

  if (parsed.flag("help") || platform == null) {
    stdout.writeln("Usage: dart run tools/take_screenshots/take_screenshots.dart ${parsed.command?.name ?? "<${parser.commands.keys.join("|")}>"} [options]\n");
    stdout.writeln(parser.commands[parsed.command?.name]?.usage ?? parser.usage);
    exit(parsed.flag("help") ? 0 : 1);
  }

  final command = parsed.command!;

  final isAndroid = platform == "android";
  final locales = command.multiOption("locale").isNotEmpty
      ? command.multiOption("locale")
      : (isAndroid ? androidLocales : iosLocales);

  final requested = command.multiOption("device");
  final devices = (isAndroid ? androidDevices : iosDevices)
      .where((e) => requested.isEmpty || requested.contains(e.name))
      .toList();
  if (devices.isEmpty) {
    stderr.writeln("No matching device. Known devices: "
        "${(isAndroid ? androidDevices : iosDevices).map((e) => e.name).join(", ")}");
    exit(1);
  }

  // clean up the booted device on Ctrl+C, which would otherwise leak
  final sigint = ProcessSignal.sigint.watch().listen((_) async {
    stdout.writeln("\nInterrupted. Cleaning up...");
    await _server?.close();
    await shutdownDevice();
    exit(130);
  });

  try {
    for (final device in devices) {
      if (isAndroid) {
        await runOnAndroid(device, locales);
      } else {
        await runOnIos(device, locales);
      }
    }
  } finally {
    sigint.cancel();
  }
}

Future<void> runOnAndroid(Device device, List<String> locales) async {
  // kill a leftover emulator from a previous run, if any
  await runBestEffort("adb", ["-s", emulatorSerial, "emu", "kill"]);

  final emulator = p.join(Platform.environment["HOME"]!, "Library/Android/sdk/emulator/emulator");
  final process = await Process.start(
    emulator,
    ["@${device.name}", "-port", "$emulatorPort", "-netdelay", "none", "-netspeed", "full", "-no-snapshot", "-no-boot-anim"],
  );
  unawaited(process.stdout.drain<void>());
  unawaited(process.stderr.drain<void>());

  _shutdownDevice = () async {
    await runBestEffort("adb", ["-s", emulatorSerial, "emu", "kill"]);
    try {
      await process.exitCode.timeout(const Duration(seconds: 30));
    } on TimeoutException {
      stderr.writeln("The emulator did not exit in time. Killing it.");
      process.kill(ProcessSignal.sigkill);
      await process.exitCode;
    }
  };

  try {
    stdout.writeln("Android emulator started. Waiting for ADB can see the device...");
    await run("adb", ["-s", emulatorSerial, "wait-for-device"]);
    while (true) {
      final result = await Process.run("adb", ["-s", emulatorSerial, "shell", "getprop", "sys.boot_completed"]);
      if (result.stdout.toString().trim() == "1") {
        break;
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }

    // suppress "isn't responding" / "has stopped" dialogs, which corrupt screenshots
    await run("adb", ["-s", emulatorSerial, "shell", "settings", "put", "global", "hide_error_dialogs", "1"]);

    // pin the clock. The mobile signal is left alone: demo mode ignores
    // `datatype` on the emulator, and `level` is wiped whenever the modem state
    // changes, so it can't be held at a fixed value.
    await run("adb", ["-s", emulatorSerial, "shell", "settings", "put", "global", "sysui_demo_allowed", "1"]);
    await sysUiDemo(["command", "clock", "hhmm", "0941"]);

    for (final locale in locales) {
      await takeScreenshots(
        dir: device.dir,
        locale: locale,
        nameFormat: "{index}_$locale.png",
        deviceId: emulatorSerial,
        clientOs: "android",
      );
    }
  } finally {
    stdout.writeln("Stopping the Emulator server...");
    await shutdownDevice();
  }
}

Future<void> runOnIos(Device device, List<String> locales) async {
  if (await which("magick") == null) {
    stderr.writeln("Error: Imagemagick must be installed.");
    exit(1);
  }

  final udid = await resolveSimulatorUdid(device.name);

  await run("xcrun", ["simctl", "boot", udid], ignoreErrors: true);
  _shutdownDevice = () => runBestEffort("xcrun", ["simctl", "shutdown", udid]);

  try {
    stdout.writeln("Waiting for the Simulator startup...");
    await run("xcrun", ["simctl", "bootstatus", udid]);
    await run("xcrun", [
      "simctl", "status_bar", udid, "override",
      "--time", "09:41",
      "--dataNetwork", "wifi",
      "--wifiMode", "active",
      "--wifiBars", "3",
      "--batteryState", "discharging",
      "--batteryLevel", "100",
      "--cellularMode", "active",
    ]);

    for (final locale in locales) {
      await takeScreenshots(
        dir: device.dir,
        locale: locale,
        nameFormat: "{index}_${device.type}_{index}.png",
        deviceId: udid,
        clientOs: "ios",
      );
    }
  } finally {
    stdout.writeln("Stopping Simulator...");
    await shutdownDevice();
  }
}

Future<String> resolveSimulatorUdid(String deviceName) async {
  final result = await run("xcrun", ["simctl", "list", "devices", "available", "-j"]);
  final devices = (jsonDecode(result) as Map<String, dynamic>)["devices"] as Map<String, dynamic>;
  final udids = [
    for (final runtime in devices.values)
      for (final device in runtime as List<dynamic>)
        if ((device as Map<String, dynamic>)["name"] == deviceName) device["udid"] as String,
  ];
  if (udids.length != 1) {
    stderr.writeln("Expected exactly one simulator named \"$deviceName\", found ${udids.length}");
    exit(1);
  }
  return udids.single;
}

Future<void> takeScreenshots({
  required String dir,
  required String locale,
  required String nameFormat,
  required String deviceId,
  required String clientOs,
}) async {
  final screenshotDir = p.normalize(p.join(toolDir, dir.replaceAll("{locale}", locale)));
  await Directory(screenshotDir).create(recursive: true);

  stdout.writeln("Taking screenshots for locale: $locale, saving to: $screenshotDir with format: $nameFormat");

  final server = ScreenshotServer(clientOs, screenshotDir, nameFormat, deviceId);
  await server.listen();
  _server = server;

  try {
    stdout.writeln("Running Flutter screenshot test driver...");
    final result = await Process.run("fvm", [
      "flutter", "drive",
      "--driver", p.join(toolDir, "driver.dart"),
      "-d", deviceId,
      "--target", p.join(toolDir, "take_screenshots_test.dart"),
      "--dart-define", "SCREENSHOT_MODE=true",
      "--dart-define", "LOCALE=$locale",
    ], workingDirectory: projectRoot);
    if (result.exitCode != 0) {
      // `flutter drive` reports test failures on stdout, so dump both
      stderr..write(result.stdout)..write(result.stderr);
      throw "flutter drive exited with non-zero code ${result.exitCode}";
    }
  } finally {
    await server.close();
    _server = null;
  }
}

/// Sends a SystemUI demo mode broadcast to the emulator.
///
/// [extras] are flat key/value pairs, e.g. `["command", "clock", "hhmm", "0941"]`.
/// Requires the `sysui_demo_allowed` setting to be enabled.
Future<void> sysUiDemo(List<String> extras) async {
  await run("adb", [
    "-s", emulatorSerial, "shell", "am", "broadcast",
    "-a", "com.android.systemui.demo",
    for (var i = 0; i < extras.length; i += 2) ...["-e", extras[i], extras[i + 1]],
  ]);
}

/// Shuts down the currently booted device, if any.
///
/// Clears the callback first so that the `finally` block and the SIGINT
/// handler can't both run it.
Future<void> shutdownDevice() async {
  final shutdown = _shutdownDevice;
  _shutdownDevice = null;
  await shutdown?.call();
}

/// Runs a cleanup command, ignoring failures and giving up after [timeout].
///
/// `adb emu kill` and `simctl shutdown` occasionally never return, which used
/// to wedge the whole run; cleanup must never block.
Future<void> runBestEffort(
  String executable,
  List<String> args, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  try {
    await Process.run(executable, args).timeout(timeout);
  } catch (e) {
    stderr.writeln("$executable ${args.join(" ")} failed or timed out: $e");
  }
}

/// Runs [executable] and returns its stdout, throwing on a non-zero exit code.
Future<String> run(String executable, List<String> args, {bool ignoreErrors = false}) async {
  final result = await Process.run(executable, args);
  if (!ignoreErrors && result.exitCode != 0) {
    throw "$executable exited with non-zero code ${result.exitCode}: ${result.stderr}";
  }
  return result.stdout.toString();
}

Future<String?> which(String executable) async {
  final result = await Process.run("which", [executable]);
  return result.exitCode == 0 ? result.stdout.toString().trim() : null;
}
