import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_symbols_icons/symbols.dart";

import "../../i18n/strings.g.dart";
import "../../models/character.dart";
import "../../providers/versions.dart";
import "../../routes.dart";
import "../../ui_core/dialog.dart";
import "../../ui_core/snack_bar.dart";
import "../../view_models/bookmarks/artifact_bookmark_list_view_model.dart";
import "../async_value_widget.dart";
import "../center_text.dart";
import "item_link_button.dart";

class BookmarksArtifactsTab extends ConsumerWidget {
  const BookmarksArtifactsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(artifactBookmarkListViewModelProvider);

    return AsyncValueWidget(
      value: bookmarksAsync,
      builder: (context, bookmarks) {
        if (bookmarks.isEmpty) {
          return CenterText(tr.bookmarksPage.noBookmarks);
        }

        return ReorderableListView.builder(
          itemCount: bookmarks.length,
          buildDefaultDragHandles: false,
          onReorderItem: ref.read(artifactBookmarkListViewModelProvider.notifier).reorder,
          itemBuilder: (context, index) {
            final item = bookmarks[index];

            return Padding(
              key: ValueKey(item.id),
              padding: .symmetric(horizontal: 16),
              child: Column(
                children: [
                  // group header
                  Row(
                    children: [
                      ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Symbols.drag_handle, size: 32),
                      ),
                      Expanded(child: _Header(
                        state: item,
                        onUnBookmark: () {
                          showSimpleDialog(
                            context: context,
                            title: tr.bookmarksPage.unBookmark,
                            content: tr.bookmarksPage.unBookmarkConfirm,
                            showCancel: true,
                            onOkPressed: () async {
                              if (!ref.context.mounted) {
                                return;
                              }
                              final vm = ref.read(artifactBookmarkListViewModelProvider.notifier);
                              await vm.removeBookmark(item.id);
                              if (context.mounted) {
                                showSnackBar(context: context, message: tr.materialCard.unBookmarked);
                              }
                            },
                          );
                        },
                      )),
                    ],
                  ),
                  switch (item) {
                    final ArtifactSetBookmarkItemState set => _ArtifactSetDetails(set),
                    final ArtifactPieceBookmarkItemState piece => _ArtifactPieceDetails(piece),
                  },
                  if (index < bookmarks.length - 1)
                    const Divider(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ArtifactSetDetails extends ConsumerWidget {
  final ArtifactSetBookmarkItemState bookmark;

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
            for (final set in bookmark.sets)
              Flexible(
                child: ItemLinkButton(
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
                            Text("(${tr.artifactDetailsPage.nSet(n: 4 ~/ bookmark.sets.length)})"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),

        for (final e in bookmark.mainStats.entries)
          if (e.value != null)
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "${tr.bookmarksPage.main} (${assetData.artifactPieceTypes[e.key]!.desc.localized})",
                ),
                const TextSpan(text: ": "),
                TextSpan(text: assetData.stats[e.value]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),

        if (bookmark.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
      ],
    );
  }
}

class _ArtifactPieceDetails extends ConsumerWidget {
  final ArtifactPieceBookmarkItemState bookmark;

  const _ArtifactPieceDetails(this.bookmark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDataAsync = ref.watch(assetDataProvider);
    assert(assetDataAsync.value != null, "Must be used in a DataAssetScope");

    final assetData = assetDataAsync.value!;

    final piece = assetData.artifactPieces[bookmark.piece]!;
    final setId = piece.parentId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        ItemLinkButton(
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

        if (bookmark.mainStat != null)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.main),
              const TextSpan(text: ": "),
              TextSpan(text: assetData.stats[bookmark.mainStat]!.localized, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),

        if (bookmark.subStats.isNotEmpty)
          Text.rich(TextSpan(
            children: [
              TextSpan(text: tr.bookmarksPage.sub),
              const TextSpan(text: ": "),
              TextSpan(text: bookmark.subStats.map((e) => assetData.stats[e]!.localized).join(", "), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
      ],
    );
  }
}

class _Header extends ConsumerWidget {
  final ArtifactBookmarkItemState state;
  final VoidCallback onUnBookmark;

  const _Header({required this.state, required this.onUnBookmark});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetData = ref.watch(assetDataProvider).requireValue;
    final typeText = switch (state) {
      ArtifactSetBookmarkItemState() => tr.bookmarksPage.artifactSet,
      ArtifactPieceBookmarkItemState() => tr.bookmarksPage.artifactPiece,
    };

    return Row(
      children: [
        ItemLinkButton(
          onTap: () {
            CharacterDetailsRoute(id: state.characterId).push(context);
          },
          child: Image.file(assetData.characters[state.characterId]!.getSmallImageFile(assetData.assetDir), width: 35, height: 35),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(typeText, style: Theme.of(context).textTheme.titleMedium!),
        ),
        IconButton(
          icon: const Icon(Symbols.bookmark_remove),
          onPressed: onUnBookmark,
        ),
      ],
    );
  }
}
