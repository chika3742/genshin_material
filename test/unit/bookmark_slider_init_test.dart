import "package:flutter_test/flutter_test.dart";

/// Replicates the bookmark-start computation from _CharacterDetailsPageState.init().
int computeBookmarkStart({
  required List<int> levelTicks,
  required int minUpperLevel,
}) {
  final index = levelTicks.indexOf(minUpperLevel);
  return index >= 1 ? levelTicks[index - 1] : 1;
}

/// Replicates the full slider start computation.
/// When bookmarks exist, characterCurrentLevel is ignored.
int computeSliderStart({
  required List<int> levelTicks,
  required int characterCurrentLevel,
  required int? bookmarkMinUpperLevel,
}) {
  if (bookmarkMinUpperLevel == null) {
    return characterCurrentLevel;
  }
  return computeBookmarkStart(
    levelTicks: levelTicks,
    minUpperLevel: bookmarkMinUpperLevel,
  );
}

void main() {
  // Typical character ascension ticks: 1, 20, 40, 50, 60, 70, 80, 90
  const characterTicks = [1, 20, 40, 50, 60, 70, 80, 90];

  // Typical talent ticks: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  const talentTicks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  group("computeBookmarkStart", () {
    test("returns previous tick for mid-range minUpperLevel", () {
      // minUpperLevel=40 is at index 2, so start = ticks[1] = 20
      expect(
        computeBookmarkStart(levelTicks: characterTicks, minUpperLevel: 40),
        20,
      );
    });

    test("returns 1 when minUpperLevel is the first tick", () {
      // minUpperLevel=1 is at index 0, fallback to 1
      expect(
        computeBookmarkStart(levelTicks: characterTicks, minUpperLevel: 1),
        1,
      );
    });

    test("returns 1 when minUpperLevel is the second tick (20)", () {
      // minUpperLevel=20 is at index 1, so start = ticks[0] = 1
      expect(
        computeBookmarkStart(levelTicks: characterTicks, minUpperLevel: 20),
        1,
      );
    });

    test("returns correct start for last tick", () {
      // minUpperLevel=90 is at index 7, so start = ticks[6] = 80
      expect(
        computeBookmarkStart(levelTicks: characterTicks, minUpperLevel: 90),
        80,
      );
    });

    test("works for talent ticks", () {
      // minUpperLevel=6 is at index 5, so start = ticks[4] = 5
      expect(
        computeBookmarkStart(levelTicks: talentTicks, minUpperLevel: 6),
        5,
      );
    });
  });

  group("computeSliderStart (with character state)", () {
    test("uses characterCurrentLevel when no bookmarks", () {
      expect(
        computeSliderStart(
          levelTicks: characterTicks,
          characterCurrentLevel: 40,
          bookmarkMinUpperLevel: null,
        ),
        40,
      );
    });

    test("uses bookmarkStart and ignores characterCurrentLevel when bookmarks exist",
        () {
      // bookmark minUpperLevel=40 → bookmarkStart=20; character=50 → ignored
      expect(
        computeSliderStart(
          levelTicks: characterTicks,
          characterCurrentLevel: 50,
          bookmarkMinUpperLevel: 40,
        ),
        20,
      );
    });

    test("uses bookmarkStart when character is at level 1", () {
      // bookmark minUpperLevel=40 → bookmarkStart=20
      expect(
        computeSliderStart(
          levelTicks: characterTicks,
          characterCurrentLevel: 1,
          bookmarkMinUpperLevel: 40,
        ),
        20,
      );
    });

    test("returns 1 when bookmark minUpperLevel is the first tick", () {
      expect(
        computeSliderStart(
          levelTicks: characterTicks,
          characterCurrentLevel: 40,
          bookmarkMinUpperLevel: 1,
        ),
        1,
      );
    });
  });
}
