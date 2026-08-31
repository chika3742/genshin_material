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

  test("isMinorVersionUpdated returns false for equal versions", () {
    expect(isMinorVersionUpdated("1.2.3", "1.2.3"), isFalse);
  });

  test("isMinorVersionUpdated returns false for malformed versions", () {
    // too few parts
    expect(isMinorVersionUpdated("1.2", "1.3.0"), isFalse);
    expect(isMinorVersionUpdated("1.2.3", "2.0"), isFalse);
    // too many parts
    expect(isMinorVersionUpdated("1.2.3", "1.3.0.1"), isFalse);
    // empty
    expect(isMinorVersionUpdated("", "1.3.0"), isFalse);
    expect(isMinorVersionUpdated("1.2.3", ""), isFalse);
  });

  test("isMinorVersionUpdated ignores pre-release suffixes on the patch part", () {
    // the suffix lives on the patch part, so it never affects the result
    expect(isMinorVersionUpdated("1.2.3-beta", "1.2.3"), isFalse);
    expect(isMinorVersionUpdated("1.2.3", "1.2.4-beta"), isFalse);
    expect(isMinorVersionUpdated("1.2.3-beta", "1.3.0"), isTrue);
  });
}
