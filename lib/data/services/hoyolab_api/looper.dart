import "../../../models/hoyolab_api.dart";

/// Loops through the pages of the API call until a character with the
/// specified IDs is found.
Future<T?> loopUntilCharacter<T extends WithId>(List<int> characterIds, Future<HoyolabListData<T>> Function(int page) apiCall) async {
  var page = 1;
  while (true) {
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
