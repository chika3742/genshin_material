import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_utils.dart";
import "package:genshin_material/models/hoyolab_api.dart";

void main() {
  group("loopUntilCharacter", () {
    AvatarListResultItem buildAvatar(int id) => AvatarListResultItem(
          id: id,
          name: "avatar-$id",
          currentLevel: 1,
          maxLevel: 90,
          skills: const [],
        );

    test("returns the first matching character across the pages", () async {
      final pages = {
        1: [buildAvatar(1), buildAvatar(2)],
        2: [buildAvatar(3)],
      };

      final found =
          await HoyolabApiUtils.loopUntilCharacter<AvatarListResultItem>(
        [3],
        (page) async => HoyolabListData(list: pages[page] ?? const []),
      );

      expect(found?.id, 3);
    });

    test("returns null once a page comes back empty", () async {
      var calls = 0;

      final found = await HoyolabApiUtils.loopUntilCharacter<
          AvatarListResultItem>([99], (page) async {
        calls++;
        return HoyolabListData(list: page == 1 ? [buildAvatar(1)] : const []);
      });

      expect(found, isNull);
      expect(calls, 2);
    });

    test("stops paging as soon as the character is found", () async {
      var calls = 0;

      await HoyolabApiUtils.loopUntilCharacter<AvatarListResultItem>(
        [1],
        (page) async {
          calls++;
          return HoyolabListData(list: [buildAvatar(1)]);
        },
      );

      expect(calls, 1);
    });
  });
}
