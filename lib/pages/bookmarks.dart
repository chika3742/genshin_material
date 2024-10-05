import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../components/material_card.dart";
import "../components/material_item.dart";
import "../db/bookmark_db_extension.dart";
import "../db/bookmark_order_registry_db_extension.dart";
import "../i18n/strings.g.dart";
import "../models/bookmark.dart";
import "../models/common.dart";
import "../models/material_bookmark_frame.dart";
import "../providers/database_provider.dart";
import "../providers/versions.dart";
import "../routes.dart";
import "../ui_core/dialog.dart";
import "../ui_core/layout.dart";

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
      ),
      body: const QuantityTickerHandler(
        child: _BookmarkList(),
      ),
    );
  }
}

class _BookmarkList extends HookConsumerWidget {
  const _BookmarkList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");
    final assetData = assetDataAsync.value!;

    final db = ref.watch(appDatabaseProvider);
    final bookmarksStream = useMemoized(() => db.watchBookmarks(), [db]);
    final bookmarksSnapshot = useStream(bookmarksStream);

    final bookmarks = bookmarksSnapshot.data ?? [];
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

    final bookmarkOrderSnapshot = useStream(useMemoized(() => db.watchBookmarkOrder()));
    final bookmarkOrder = bookmarkOrderSnapshot.data;

    if (bookmarkOrder != null) {
      _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);
    }

    return Stack(
      children: [
        ReorderableListView.builder(
          itemCount: bookmarkGroups.length,
          onReorder: (oldIndex, newIndex) {
            if (bookmarkOrder == null) {
              return;
            }

            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            try {
              bookmarkOrder.insert(newIndex, bookmarkOrder.removeAt(oldIndex));
              _sortBookmarkGroups(bookmarkGroups, bookmarkOrder);

              db.updateBookmarkOrder(bookmarkOrder);
            } on RangeError catch (e, st) {
              log("Reorder failed: $oldIndex -> $newIndex, length: ${bookmarkOrder.length}", error: e, stackTrace: st);
            }
          },
          buildDefaultDragHandles: false,
          itemBuilder: (context, index) {
            final group = bookmarkGroups[index];
            final character = assetData.characters[group.characterId];

            return Padding(
              key: ValueKey(index),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Symbols.drag_handle),
                      ),
                      Expanded(
                        child: _ItemLinkButton(
                          onTap: () {
                            CharacterDetailsRoute(id: group.characterId).push(context);
                          },
                          child: Row(
                            children: [
                              Image.file(character!.getSmallImageFile(assetData.assetDir), width: 35, height: 35),
                              const SizedBox(width: 8),
                              Flexible(
                                child: FittedBox(
                                  child: Text(character.name.localized, style: const TextStyle(fontSize: 18)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                  ),
                  if (group.type == BookmarkType.material)
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (final items in group.bookmarks.cast<BookmarkWithMaterialDetails>().groupListsBy((e) => e.materialDetails.materialId).values)
                          MaterialItem(
                            key: Key("${group.hashCode}:${items.first.materialDetails.materialId}"),
                            item: MaterialCardMaterial.fromBookmarks(items.map((e) => e.materialDetails).toList()),
                            usage: MaterialUsage(
                              characterId: group.characterId,
                              weaponId: items.first.materialDetails.weaponId,
                            ),
                            hashes: items.map((e) => e.materialDetails.hash).toList(),
                            expItems: assetData.characterIngredients.expItems,
                          ),
                        IconButton(
                          icon: const Icon(Symbols.expand_content),
                          iconSize: 28,
                          onPressed: () {

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
              WeaponDetailsRoute(id: weapon.id).push(context);
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


class _ArtifactSetDetails extends ConsumerWidget {
  final BookmarkWithArtifactSetDetails bookmark;

  const _ArtifactSetDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    return GappedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                      Image.file(assetData.artifactSets[set]!.consistsOf.values.first.getImageFile(assetData.assetDir), width: 35, height: 35),
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
    final setId = assetData.artifactPieceSetMap[pieceId]!;

    final piece = assetData.artifactSets[setId]!.consistsOf.values.firstWhere((e) => e.id == pieceId);

    return GappedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
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
