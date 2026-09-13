import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_exceptions.dart";

void main() {
  group("HoyolabApiException", () {
    test("treats the known retcodes as silent", () {
      for (final retcode in [-502002, -502001, 10102, -100]) {
        expect(
          HoyolabApiException(retcode, "message").isSilent,
          isTrue,
          reason: "$retcode",
        );
      }
    });

    test("treats an unknown retcode as not silent", () {
      expect(const HoyolabApiException(-1, "message").isSilent, isFalse);
    });

    test("renders the message and the retcode in toString", () {
      expect(
        const HoyolabApiException(10102, "boom").toString(),
        "HoyolabApiException: boom, retcode: 10102",
      );
    });
  });

  group("the credential-state exceptions", () {
    test("are silent, since they describe a state rather than a fault", () {
      expect(const HoyolabLinkDisabledException().isSilent, isTrue);
      expect(const HoyolabNotSignedInException().isSilent, isTrue);
      expect(const HoyolabServerNotSelectedException().isSilent, isTrue);
    });
  });
}
