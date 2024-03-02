import "package:freezed_annotation/freezed_annotation.dart";

import "character_ingredients.dart";

part "bookmarkable_material.freezed.dart";

@freezed
class BookmarkableMaterial with _$BookmarkableMaterial {
  const BookmarkableMaterial._();

  const factory BookmarkableMaterial({
    String? id,
    required List<BookmarkableMaterialLevel> levels,
  }) = _BookmarkableMaterial;

  int get sum => levels.fold(0, (prev, level) => prev + switch (level) {
    _BookmarkableMaterialLevel(:final quantity) => quantity,
    BookmarkableMaterialLevelExp(:final exp) => exp,
  },);
}

@freezed
sealed class BookmarkableMaterialLevel with _$BookmarkableMaterialLevel {
  const factory BookmarkableMaterialLevel({
    required int level,
    required int quantity,
  }) = _BookmarkableMaterialLevel;

  const factory BookmarkableMaterialLevel.exp({
    required int level,
    required int exp,
  }) = BookmarkableMaterialLevelExp;
}

@freezed
class IngredientsWithLevel with _$IngredientsWithLevel {
  const factory IngredientsWithLevel({
    required int level,
    required List<CharacterIngredient> ingredients,
  }) = _IngredientsWithLevel;
}