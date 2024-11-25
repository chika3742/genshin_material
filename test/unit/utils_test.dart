import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/utils/semver.dart";

void main() {
  test("isMinorVersionUpdated", () {
    // patch version is changed
    expect(isMinorVersionUpdated("1.2.3", "1.2.4"), isFalse);
    // minor version is changed
    expect(isMinorVersionUpdated("1.2.3", "1.3.0"), isTrue);
    // major version is changed
    expect(isMinorVersionUpdated("1.2.3", "2.0.0"), isTrue);
    // major version is changed without changing minor version
    expect(isMinorVersionUpdated("2.0.0", "3.0.0"), isTrue);
  });
}
