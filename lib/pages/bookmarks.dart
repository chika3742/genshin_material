import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../components/center_text.dart";
import "../components/furnishing_counter.dart";
import "../components/material_item.dart";
import "../constants/dimens.dart";
import "../core/asset_cache.dart";
import "../db/bookmark_db_extension.dart";
import "../db/bookmark_order_registry_db_extension.dart";
import "../db/furnishing_db_extension.dart";
import "../i18n/strings.g.dart";
import "../models/bookmark.dart";
import "../models/common.dart";
import "../models/material_bookmark_frame.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/bottom_sheet.dart";
import "../ui_core/dialog.dart";
import "../ui_core/error_messages.dart";
import "../ui_core/layout.dart";
import "../ui_core/snack_bar.dart";

class BookmarksPage extends HookConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);

    final bookmarks = ref.watch(bookmarksProvider());

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
        bottom: bookmarks.value != null
            ? TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: tr.bookmarksPage.byPurpose),
                  Tab(text: tr.bookmarksPage.byMaterial),
                  Tab(text: tr.bookmarksPage.furnishings),
                ],
              )
            : null,
      ),
      body: switch(bookmarks) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncData() => TabBarView(
          controller: tabController,
          children: [
            _PurposeGroupedBookmarkList(),
            _MaterialGroupedBookmarkList(),
            _FurnishingBookmarkList(),
          ],
        ),
        AsyncError(:final error) => CenterText(getErrorMessage(error)),
      },
    );
  }
}


class _PurposeGroupedBookmarkList extends ConsumerWidget {
  const _PurposeGroupedBookmarkList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");
    final assetData = assetDataAsync.value!;

    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    if (bookmarks.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    final bookmarkGroups = bookmarks.groupFoldBy<String, List<BookmarkWithDetails>>(
      (e) => e.metadata.groupHash,
      (prev, element) {
        if (prev == null) {
          return <BookmarkWithDetails>[element];
        } else {
          prev.add(element);
          return prev;
        }
      },
    ).values.map((e) => BookmarkGroup.fromBookmarks(e, assetData)).toList();

    final bookmarkOrderSnapshot = ref.watch(bookmarkOrderProvider);
    final bookmarkOrder = bookmarkOrderSnapshot.value;

    if (bookmarkOrder != null) {
      _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);
    }

    return Stack(
      children: [
        ReorderableListView.builder(
          itemCount: bookmarkGroups.length,
          padding: const EdgeInsets.only(top: 8),
          onReorder: (oldIndex, newIndex) {
            if (bookmarkOrder == null) {
              return;
            }

            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            try {
              bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
              // sort with new order to avoid flickering when reordering
              _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);

              final db = ref.read(appDatabaseProvider);
              db.updateBookmarkOrder(bookmarkOrder);
            } on RangeError catch (e, st) {
              log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
            }
          },
          buildDefaultDragHandles: false,
          itemBuilder: (context, index) {
            final group = bookmarkGroups[index];

            return Padding(
              key: Key(group.hash),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // group header
                  Row(
                    children: [
                      ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Symbols.drag_handle, size: 32),
                      ),
                      Expanded(child: _PurposeHeader(group: group)),
                    ],
                  ),
                  if (group.type == BookmarkType.material)
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (final items in _sortBookmarks(group.bookmarks.cast<BookmarkWithMaterialDetails>(), assetData)
                              .groupListsBy((e) => e.materialDetails.materialId).values)
                          MaterialItem(
                            key: Key("${group.hash}:${items.first.materialDetails.materialId}"),
                            item: MaterialCardMaterial.fromBookmarks(items.map((e) => e.materialDetails).toList()),
                            usage: MaterialUsage(
                              characterId: group.characterId,
                              weaponId: items.first.materialDetails.weaponId,
                            ),
                            hashes: items.map((e) => e.materialDetails.hash).toList(),
                            expItems: items.first.materialDetails.weaponId == null
                                ? assetData.characterIngredients.expItems
                                : assetData.weaponIngredients.expItems,
                          ),
                        IconButton(
                          icon: const Icon(Symbols.expand_content),
                          iconSize: 28,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              isScrollControlled: true,
                              builder: (context) {
                                return _LevelBookmarkDetail(groupHash: group.hash);
                              },
                            );
                          },
                        ),
                      ],
                    ),

                  if (group.type == BookmarkType.artifactSet)
                    _ArtifactSetDetails(group.bookmarks.first as BookmarkWithArtifactSetDetails),

                  if (group.type == BookmarkType.artifactPiece)
                    _ArtifactPieceDetails(group.bookmarks.first as BookmarkWithArtifactPieceDetails),

                  Visibility(
                    visible: index < bookmarkGroups.length - 1,
                    replacement: const SizedBox(height: 16),
                    child: const Divider(),
                  ),
                ],
              ),
            );
          },
        ),
        if (bookmarks.isEmpty) Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Text(tr.bookmarksPage.noBookmarks, style: const TextStyle(
            fontSize: 16,
          ),),
        ),
      ],
    );
  }

  void _sortBookmarkGroups(List<BookmarkGroup> groups, List<String> order) {
    groups.sort((a, b) => order.indexOf(a.hash).compareTo(order.indexOf(b.hash)));
  }
}


class _GroupTypeText extends HookConsumerWidget {
  final BookmarkGroup group;

  const _GroupTypeText(this.group);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    switch (group.type) {
      case BookmarkType.material:
        final materialDetails = (group.bookmarks.first as BookmarkWithMaterialDetails).materialDetails;
        if (materialDetails.weaponId == null) {
          final purposeType = materialDetails.purposeType;
          return switch (purposeType) {
            Purpose.ascension => _buildText(tr.bookmarksPage.character),
            Purpose.normalAttack || Purpose.elementalSkill || Purpose.elementalBurst => _buildText(tr.talentTypes[purposeType.name]!),
          };
        } else {
          final weapon = assetData.weapons[materialDetails.weaponId]!;
          return _ItemLinkButton(
            onTap: () {
              WeaponDetailsRoute(
                id: weapon.id,
                initialSelectedCharacter: group.characterId,
              ).push(context);
            },
            child: Row(
              children: [
                _buildText(tr.bookmarksPage.weapon),
                Image.file(weapon.getImageFile(assetData.assetDir), width: 35, height: 35),
              ],
            ),
          );
        }
      case BookmarkType.artifactSet:
        return _buildTextWithUnBookmarkButton(tr.bookmarksPage.artifactSet, ref);
      case BookmarkType.artifactPiece:
        return _buildTextWithUnBookmarkButton(tr.bookmarksPage.artifactPiece, ref);
    }
  }

  Widget _buildText(String text) {
    final context = useContext();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium!),
    );
  }

  Widget _buildTextWithUnBookmarkButton(String text, WidgetRef ref) {
    final context = useContext();

    return Row(
      children: [
        _buildText(text),
        IconButton(
          icon: const Icon(Symbols.bookmark_remove),
          onPressed: () {
            showSimpleDialog(
              context: context,
              title: tr.bookmarksPage.unBookmark,
              content: tr.bookmarksPage.unBookmarkConfirm,
              showCancel: true,
              onOkPressed: () {
                if (context.mounted) {
                  final db = ref.read(appDatabaseProvider);
                  db.removeBookmarks([group.bookmarks.first.metadata.id]);
                }
              },
            );
          },
        ),
      ],
    );
  }
}

class _MaterialGroupedBookmarkList extends ConsumerWidget {
  const _MaterialGroupedBookmarkList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;
    final bookmarks = ref.watch(bookmarksProvider()).value ?? [];
    if (bookmarks.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }

    final bookmarkMaterials = _sortBookmarks(bookmarks.whereType<BookmarkWithMaterialDetails>(), assetData)
        .groupFoldBy<String?, List<BookmarkWithMaterialDetails>>(
          (e) => e.materialDetails.materialId ?? (e.materialDetails.weaponId != null).toString(),
          (prev, element) {
            if (prev == null) {
              return <BookmarkWithMaterialDetails>[element];
            } else {
              prev.add(element);
              return prev;
            }
          },
        );

    return ListView.separated(
      itemCount: bookmarkMaterials.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final bookmarks = bookmarkMaterials.values.elementAt(index);
        final assetData = ref.watch(assetDataProvider).value!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            key: ValueKey(bookmarks.first.materialDetails.materialId),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MaterialItem(
                  item: MaterialCardMaterial.fromBookmarks(bookmarks.map((e) => e.materialDetails).toList()),
                  hashes: bookmarks.map((e) => e.materialDetails.hash).toList(),
                  expItems: bookmarks.first.materialDetails.weaponId == null
                      ? assetData.characterIngredients.expItems
                      : assetData.weaponIngredients.expItems,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Symbols.bookmark_remove),
                    onPressed: () async {
                      final db = ref.read(appDatabaseProvider);
                      await db.removeBookmarks(bookmarks.map((e) => e.metadata.id).toList());

                      if (context.mounted) {
                        showSnackBar(
                          context: context,
                          message: tr.materialCard.unBookmarked,
                          action: SnackBarAction(
                            label: tr.common.undo,
                            onPressed: () {
                              db.addMaterialBookmarks(bookmarks.map((e) => MaterialBookmarkInsertable(
                                metadataId: e.metadata.id,
                                characterId: e.metadata.characterId,
                                weaponId: e.materialDetails.weaponId,
                                materialId: e.materialDetails.materialId,
                                upperLevel: e.materialDetails.upperLevel,
                                purposeType: e.materialDetails.purposeType,
                                quantity: e.materialDetails.quantity,
                              ),).toList(),);
                            },
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Symbols.expand_content),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return _MaterialBookmarkDetail(
                            materialId: bookmarks.first.materialDetails.materialId,
                            hasWeapon: bookmarks.first.materialDetails.weaponId != null,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}


class _ArtifactSetDetails extends ConsumerWidget {
  final BookmarkWithArtifactSetDetails bookmark;

  const _ArtifactSetDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Row(
          children: [
            for (final set in bookmark.artifactSetDetails.sets)
              Flexible(
                child: _ItemLinkButton(
                  onTap: () {
                    ArtifactDetailsRoute(id: set).push(context);
                  },
                  child: Row(
                    children: [
                      Image.file(
                        assetData.artifactSets[set]!
                            .getFirstPiece(assetData)
                            .getImageFile(assetData.assetDir),
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Wrap(
                          spacing: 8,
                          children: [
                            Text(assetData.artifactSets[set]!.name.localized),
                            Text("(${tr.artifactDetailsPage.nSet(n: 4 ~/ bookmark.artifactSetDetails.sets.length)})"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),

        for (final e in bookmark.artifactSetDetails.mainStats.entries)
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "${tr.bookmarksPage.main} (${assetData.artifactPieceTypes[e.key]!.desc.localized})",
              ),
              const TextSpan(text: ": "),
              TextSpan(text: assetData.stats[e.value]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),

        if (bookmark.artifactSetDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactSetDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),
      ],
    );
  }
}

class _ArtifactPieceDetails extends ConsumerWidget {
  final BookmarkWithArtifactPieceDetails bookmark;

  const _ArtifactPieceDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    final pieceId = bookmark.artifactPieceDetails.piece;
    final setId = assetData.artifactPieces[pieceId]!.parentId;

    final piece = assetData.artifactPieces[pieceId]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        _ItemLinkButton(
          onTap: () {
            ArtifactDetailsRoute(id: setId).push(context);
          },
          child: Row(
            children: [
              Image.file(piece.getImageFile(assetData.assetDir), width: 35, height: 35),
              const SizedBox(width: 8),
              Flexible(
                child: Wrap(
                  spacing: 8,
                  children: [
                    Text(piece.name.localized),
                    Text("(${assetData.artifactPieceTypes[piece.type]!.desc.localized})"),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (bookmark.artifactPieceDetails.mainStat != null)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.main),
              const TextSpan(text: ": "),
              TextSpan(text: assetData.stats[bookmark.artifactPieceDetails.mainStat]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),

        if (bookmark.artifactPieceDetails.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.artifactPieceDetails.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),),
      ],
    );
  }
}

class _ItemLinkButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget? child;
  
  const _ItemLinkButton({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}

class _LevelBookmarkDetail extends StatelessWidget {
  final String groupHash;

  const _LevelBookmarkDetail({required this.groupHash});

  @override
  Widget build(BuildContext context) {
    return ScrollableBottomSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.6,
      builder: (context) {
        return HookConsumer(
          builder: (context, ref, child) {
            final assetData = ref.watch(assetDataProvider).value!;
            final bookmarks = ref.watch(bookmarksProvider(groupHash: groupHash))
                .value?.cast<BookmarkWithMaterialDetails>();

            useValueChanged<bool?, void>(bookmarks?.isEmpty, (_, _){
              if (bookmarks != null && bookmarks.isEmpty) {
                Navigator.of(context).pop();
              }
            });

            if (bookmarks == null || bookmarks.isEmpty) {
              return const SizedBox(width: double.infinity);
            }

            final levels = bookmarks.groupListsBy((e) => e.materialDetails.upperLevel);

            return Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Transform.translate(
                    offset: const Offset(-8, 0),
                    child: SectionInnerHeading(tr.purposes[bookmarks.first.materialDetails.purposeType.name]!),
                  ),
                  for (final level in levels.entries.sorted((a, b) => a.key.compareTo(b.key))) ...[
                    Text("Lv. ${level.key}", style: GoogleFonts.titilliumWeb(fontSize: 20)),
                    Wrap(
                      children: [
                        for (final item in _sortBookmarks(level.value, assetData))
                          MaterialItem(
                            item: MaterialCardMaterial.fromBookmarks([item.materialDetails]),
                            usage: MaterialUsage(
                              characterId: item.metadata.characterId,
                              weaponId: item.materialDetails.weaponId,
                            ),
                            expItems: item.materialDetails.weaponId == null
                                ? assetData.characterIngredients.expItems
                                : assetData.weaponIngredients.expItems,
                            hashes: [item.materialDetails.hash],
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _MaterialBookmarkDetail extends StatelessWidget {
  const _MaterialBookmarkDetail({required this.materialId, required this.hasWeapon});

  final String? materialId;
  final bool hasWeapon;

  @override
  Widget build(BuildContext context) {
    return ScrollableBottomSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.6,
      builder: (context) {
        return HookConsumer(
          builder: (context, ref, child) {
            final assetData = ref.watch(assetDataProvider).value!;
            final bookmarks = ref.watch(bookmarksProvider(materialFilter: (materialId: materialId, hasWeapon: hasWeapon)))
                .value?.cast<BookmarkWithMaterialDetails>();

            useValueChanged<bool?, void>(bookmarks?.isEmpty, (_, _){
              if (bookmarks != null && bookmarks.isEmpty) {
                Navigator.of(context).pop();
              }
            });

            if (bookmarks == null || bookmarks.isEmpty) {
              return const SizedBox(width: double.infinity);
            }

            final groups = bookmarks.groupFoldBy<String, List<BookmarkWithMaterialDetails>>(
              (e) => e.metadata.groupHash,
              (prev, element) {
                if (prev == null) {
                  return <BookmarkWithMaterialDetails>[element];
                } else {
                  prev.add(element);
                  return prev;
                }
              },
            ).values.map((e) => BookmarkGroup.fromBookmarks(e, assetData)).toList();

            return Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
              child: Column(
                spacing: 8.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialItem(
                    item: MaterialCardMaterial.fromBookmarks(bookmarks.map((e) => e.materialDetails).toList()),
                    hashes: bookmarks.map((e) => e.materialDetails.hash).toList(),
                    expItems: bookmarks.first.materialDetails.weaponId == null
                        ? assetData.characterIngredients.expItems
                        : assetData.weaponIngredients.expItems,
                  ),
                  for (final group in groups) ...[
                    _PurposeHeader(group: group),
                    for (final bookmark in group.bookmarks.cast<BookmarkWithMaterialDetails>()
                        .sorted((a, b) => a.materialDetails.upperLevel - b.materialDetails.upperLevel))
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text.rich(TextSpan(
                                children: [
                                  const TextSpan(text: "Lv. ", style: TextStyle(fontSize: 18)),
                                  TextSpan(
                                    text: bookmark.materialDetails.upperLevel
                                        .toString(),
                                    style: GoogleFonts.titilliumWeb(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),),
                            ),
                            Flexible(
                              child: MaterialItem(
                                item: MaterialCardMaterial.fromBookmarks([bookmark.materialDetails]),
                                usage: MaterialUsage(
                                  characterId: bookmark.metadata.characterId,
                                  weaponId: bookmark.materialDetails.weaponId,
                                ),
                                expItems: bookmark.materialDetails.weaponId == null
                                    ? assetData.characterIngredients.expItems
                                    : assetData.weaponIngredients.expItems,
                                hashes: [bookmark.materialDetails.hash],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _PurposeHeader extends ConsumerWidget {
  const _PurposeHeader({required this.group});

  final BookmarkGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).value!;

    return Row(
      children: [
        _ItemLinkButton(
          onTap: () {
            CharacterDetailsRoute(id: group.characterId).push(context);
          },
          child: Image.file(assetData.characters[group.characterId]!.getSmallImageFile(assetData.assetDir), width: 35, height: 35),
        ),
        const Spacer(),
        _GroupTypeText(group),
        if (group.type == BookmarkType.material)
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Lv.", style: TextStyle(fontSize: 18)),
                TextSpan(text: group.levelRange!.start.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Symbols.double_arrow),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(text: group.levelRange!.end.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            style: GoogleFonts.titilliumWeb(fontSize: 24),
          ),
      ],
    );
  }
}


class _FurnishingBookmarkList extends HookConsumerWidget {
  const _FurnishingBookmarkList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    final assetData = ref.watch(assetDataProvider).value!;

    final furnishingSetBookmarksSnapshot = useStream(
      useMemoized(() => db.watchFurnishingSetBookmarks()),
    );
    if (furnishingSetBookmarksSnapshot.data == null
        || furnishingSetBookmarksSnapshot.data!.isEmpty) {
      return CenterText(tr.bookmarksPage.noBookmarks);
    }
    final furnishingSetBookmarks = furnishingSetBookmarksSnapshot.data!;

    return ListView.builder(
      itemCount: furnishingSetBookmarks.length,
      itemBuilder: (context, index) {
        final bookmark = furnishingSetBookmarks[index];
        final set = assetData.furnishingSets[bookmark.setId];
        if (set == null) {
          return Text("error: unknown furnishing set ${bookmark.setId}");
        }

        return HookBuilder(
          key: ValueKey(set.id),
          builder: (context) {
            final counts = useStream(
              useMemoized(() => db.watchFurnishingCraftCounts(set.id)),
            ).data ?? [];
            final insufficientComponents = set.consistsOf
                .where((e) => (counts.firstWhereOrNull((c) => c.furnishingId == e.furnishingId)?.count ?? 0) < e.quantity);

            final controller = useExpansibleController();
            final isExpanded = useListenable(controller).isExpanded;

            return ExpansionTile(
              controller: controller,
              leading: Image.file(
                set.getImageFile(assetData.assetDir),
                width: listTileFurnishingSetImageWidth,
              ),
              title: Text(set.name.localized),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Symbols.info),
                    onPressed: () {
                      FurnishingSetDetailsRoute(id: set.id).push(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Symbols.bookmark_remove),
                    onPressed: () {
                      db.removeFurnishingSetBookmark(bookmark).then((restore) {
                        if (context.mounted) {
                          showSnackBar(
                            context: context,
                            message: tr.furnishingSetsPage.removedFromBookmarks,
                            action: SnackBarAction(
                              label: tr.common.undo,
                              onPressed: () {
                                restore();
                              },
                            ),
                          );
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: AnimatedRotation(
                      duration: Durations.medium2,
                      curve: Easing.emphasizedDecelerate,
                      turns: isExpanded ? 0.5 : 0,
                      child: Icon(Symbols.keyboard_arrow_down),
                    ),
                  ),
                ],
              ),
              expansionAnimationStyle: AnimationStyle(
                curve: Easing.emphasizedDecelerate,
                reverseCurve: Easing.emphasizedAccelerate,
                duration: Durations.medium2,
              ),
              children: insufficientComponents.isNotEmpty
                ? insufficientComponents.map((e) {
                    final furnishing = assetData.furnishings[e.furnishingId]!;

                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ListTile(
                        leading: Image.file(
                          furnishing.getImageFile(assetData.assetDir),
                          width: 50,
                          height: 50,
                        ),
                        title: Text(furnishing.name.localized),
                        trailing: FurnishingCounter(
                            currentCount: counts
                                .firstWhereOrNull((c) => c.furnishingId == e.furnishingId)
                                ?.count ?? 0,
                            requiredCount: e.quantity,
                            onChanged: (value) {
                              db.updateFurnishingCraftCount(
                                  set.id, e.furnishingId, value);
                            }),
                      ),
                    );
                  }).toList()
                : [
                  ListTile(
                    title: Text(tr.bookmarksPage.allFurnishingsAreCrafted),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}



List<BookmarkWithMaterialDetails> _sortBookmarks(Iterable<BookmarkWithMaterialDetails> bookmarks, AssetData assetData) {
  return bookmarks.sorted((a, b) {
    final aMaterial = assetData.materials[a.materialDetails.materialId];
    final bMaterial = assetData.materials[b.materialDetails.materialId];

    if (aMaterial == null || bMaterial == null) {
      return aMaterial == null ? -1 : 1;
    }

    final aPriority = aMaterial.getSortPriority(assetData);
    final bPriority = bMaterial.getSortPriority(assetData);

    if (aPriority == bPriority) {
      return aMaterial.hyvId.compareTo(bMaterial.hyvId);
    }

    return aPriority.compareTo(bPriority);
  });
}
