import "dart:io";

import "package:integration_test/integration_test_driver_extended.dart";

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (String screenshotName, List<int> screenshotBytes, [Map<String, Object?>? args]) async {
      final imageFile = await File(screenshotName).create(recursive: true);
      await imageFile.writeAsBytes(screenshotBytes);
      return true;
    },
  );
}
