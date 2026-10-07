import "package:genshin_material/core/api_request_queue.dart";
import "package:genshin_material/data/models/hoyolab_api.dart";
import "package:genshin_material/data/services/hoyolab/hoyolab_game_api.dart";

import "http_client.mocks.dart";
import "secure_storage.dart";

/// A single `avatarList` call recorded by [FakeHoyolabGameApi].
typedef AvatarListCall = ({int page, List<int> elementIds, List<int> weaponCatIds});

/// A [HoyolabGameApi] whose `avatarList` serves fixed [pages] instead of
/// calling HoYoLAB, and records every call in [avatarListCalls].
///
/// A page missing from [pages] comes back empty, which is how HoYoLAB signals
/// the end of the list. Set [error] to make every call throw it.
class FakeHoyolabGameApi extends HoyolabGameApi {
  FakeHoyolabGameApi({this.pages = const {}, this.error})
      : super(
          cookie: fakeCookie,
          region: "os_asia",
          uid: "800000000",
          client: MockClient(),
          queue: ApiRequestQueue(interval: Duration.zero),
        );

  final Map<int, List<AvatarListResultItem>> pages;
  final Object? error;
  final avatarListCalls = <AvatarListCall>[];

  @override
  Future<AvatarListResult> avatarList(
    int page, {
    List<int> elementIds = const [],
    List<int> weaponCatIds = const [],
  }) async {
    avatarListCalls.add((page: page, elementIds: elementIds, weaponCatIds: weaponCatIds));
    if (error case final error?) {
      throw error;
    }
    return HoyolabListData(list: pages[page] ?? const []);
  }
}

AvatarListResultItem buildTestAvatar({
  required int id,
  int elementAttrId = 0,
  int currentLevel = 1,
  List<AvatarSkill> skills = const [],
  int weaponId = 0,
  int weaponLevel = 1,
}) {
  return AvatarListResultItem(
    id: id,
    name: "",
    currentLevel: currentLevel,
    maxLevel: 90,
    skills: skills,
    elementAttrId: elementAttrId,
    weapon: AvatarWeapon(
      id: weaponId,
      maxLevel: 90,
      currentLevel: weaponLevel,
      categoryId: 0,
      rarity: 1,
      name: "",
      icon: "",
    ),
  );
}
