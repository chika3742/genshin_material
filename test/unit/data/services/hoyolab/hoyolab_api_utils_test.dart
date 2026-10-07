import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/data/models/hoyolab_api.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_api_utils.dart";

AvatarListResultItem _buildAvatar(int id) => AvatarListResultItem(
      id: id,
      name: "avatar-$id",
      currentLevel: 1,
      maxLevel: 90,
      skills: const [],
      elementAttrId: 1,
      weapon: const AvatarWeapon(
        id: 1,
        maxLevel: 90,
        currentLevel: 1,
        categoryId: 1,
        rarity: 1,
        name: "",
        icon: "",
      ),
    );

void main() {
  group("loopUntilCharacter", () {

    test("returns the first matching character across the pages", () async {
      final pages = {
        1: [_buildAvatar(1), _buildAvatar(2)],
        2: [_buildAvatar(3)],
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
        return HoyolabListData(list: page == 1 ? [_buildAvatar(1)] : const []);
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
          return HoyolabListData(list: [_buildAvatar(1)]);
        },
      );

      expect(calls, 1);
    });
  });

  group("listAllCharacters", () {
    test("collects every page until one comes back empty", () async {
      final pages = {
        1: [_buildAvatar(1), _buildAvatar(2)],
        2: [_buildAvatar(3)],
      };
      var calls = 0;

      final all = await HoyolabApiUtils.listAllCharacters<AvatarListResultItem>(
        (page) async {
          calls++;
          return HoyolabListData(list: pages[page] ?? const []);
        },
      );

      expect(all.map((e) => e.id), [1, 2, 3]);
      expect(calls, 3);
    });
  });
}
