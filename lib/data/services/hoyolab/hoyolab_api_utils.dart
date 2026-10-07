import "../../models/hoyolab_api.dart";

class HoyolabApiUtils {
  const HoyolabApiUtils._();

  /// Loops through the pages of the API call until a character with the
  /// specified IDs is found.
  static Future<T?> loopUntilCharacter<T extends WithId>(List<int> characterIds, Future<HoyolabListData<T>> Function(int page) apiCall) async {
    var page = 1;
    const maxPageCount = 5;
    while (true) {
      if (page > maxPageCount) {
        throw Exception("Max loop iteration exceeded.");
      }

      final result = await apiCall(page);

      if (result.list.isEmpty) {
        break;
      }

      for (final item in result.list) {
        if (characterIds.contains(item.id)) {
          return item;
        }
      }
      page++;
    }

    return null;
  }

  static Future<List<T>> listAllCharacters<T extends WithId>(Future<HoyolabListData<T>> Function(int page) apiCall) async {
    var page = 1;
    const maxPageCount = 10;
    final list = <T>[];
    while (true) {
      if (page > maxPageCount) {
        throw Exception("Max loop iteration exceeded.");
      }

      final result = await apiCall(page);

      if (result.list.isEmpty) {
        break;
      }

      list.addAll(result.list);

      page++;
    }
    return list;
  }
}
