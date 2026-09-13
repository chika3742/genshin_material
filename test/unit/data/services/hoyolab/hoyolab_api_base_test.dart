import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_base.dart";

import "../../../../utils/http_client.mocks.dart";
import "../../../../utils/secure_storage.dart";

class FakeHoyolabAuthenticatedApi extends HoyolabAuthenticatedApi {
  FakeHoyolabAuthenticatedApi({
    required super.cookie,
  }) : super(enabled: true, client: MockClient());
}

void main() {
  group("ltuid parsing", () {
    test("can parse ltuid", () {
      final api = FakeHoyolabAuthenticatedApi(cookie: fakeCookie);

      expect(api.ltUid, "123456");
    });

    test("can parse when ltuid key is at the top", () {
      final api = FakeHoyolabAuthenticatedApi(
        cookie: "ltuid_v2=123456; ltoken_v2=token;",
      );

      expect(api.ltUid, "123456");
    });

    test("can parse when missing semicolon", () {
      final api = FakeHoyolabAuthenticatedApi(
        cookie: "ltoken_v2=token; ltuid_v2=123456",
      );

      expect(api.ltUid, "123456");
    });
  });
}
