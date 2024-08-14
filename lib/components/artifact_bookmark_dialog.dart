import "package:animations/animations.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../core/asset_cache.dart";
import "../i18n/strings.g.dart";
import "../models/artifact.dart";
import "../models/character.dart";
import "../models/common.dart";
import "../providers/versions.dart";
import "../ui_core/page_transition.dart";
import "character_select_dropdown.dart";
import "labeled_check_box.dart";
import "layout.dart";
import "list_subheader.dart";
import "style_parsed_text.dart";

class ArtifactBookmarkDialog extends HookConsumerWidget {
  final ArtifactSetId? firstSetId;
  final ArtifactPieceId? pieceId;
  final bool showSecondSetChooser;

  const ArtifactBookmarkDialog({super.key, this.firstSetId, this.pieceId, this.showSecondSetChooser = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(firstSetId != null || pieceId != null);

    final assetDataCache = ref.watch(assetDataProvider).value;
    final assetData = assetDataCache?.data;
    final assetDir = assetDataCache?.assetDir;
    if (assetData == null || assetDir == null) {
      throw StateError("Asset data not loaded");
    }

    final characters = useMemoized(() => assetData.characters.values.whereType<CharacterOrVariant>().toList());

    final characterToEquip = useState<CharacterId?>(null);
    final mainStats = useState<Map<ArtifactPieceTypeId, ArtifactStatId?>>({});
    final subStats = useState<List<ArtifactStatId>>([]);
    final screenState = useState<_ScreenState>(showSecondSetChooser ? _ScreenState.secondSetChooser : _ScreenState.artifactDetails);
    final secondSetId = useState<ArtifactSetId?>(null);
    final characterDropdownError = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text(screenState.value == _ScreenState.artifactDetails
            ? tr.artifactDetailsPage.bookmarkArtifacts
            : tr.artifactDetailsPage.chooseSecondSet,),
        actions: [
          if (screenState.value == _ScreenState.secondSetChooser)
            TextButton(
              onPressed: secondSetId.value != null ? () {
                screenState.value = _ScreenState.artifactDetails;
              } : null,
              child: Text(tr.common.next),
            ),
          if (screenState.value == _ScreenState.artifactDetails)
            GestureDetector(
              onTap: () {
                if (characterToEquip.value == null) {
                  characterDropdownError.value = tr.common.pleaseSelect;
                }
              },
              child: TextButton(
                onPressed: characterToEquip.value != null ? _saveBookmark : null,
                child: Text(tr.common.save),
              ),
            ),
          const SizedBox(width: 24),
        ],
      ),
      body: PageTransitionSwitcher(
        duration: Durations.medium2,
        reverse: screenState.value == _ScreenState.secondSetChooser,
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: screenState.value == _ScreenState.secondSetChooser
            ? SecondArtifactChooserScreen(
                key: const PageStorageKey(0),
                assetData: assetData,
                assetDir: assetDir,
                excludedSetId: firstSetId,
                selectedSetId: secondSetId.value,
                onSetSelected: (setId) {
                  secondSetId.value = setId;
                },
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    if (firstSetId != null)
                      ListTile(
                        leading: Image.file(
                          assetData.artifactSets[firstSetId]!.consistsOf.values.first.getImageFile(assetDir),
                          width: 36,
                        ),
                        title: Text("${assetData.artifactSets[firstSetId]!.name.localized} (${tr.artifactDetailsPage.nSet(n: secondSetId.value != null ? "2" : "4")})"),
                      ),
                    if (secondSetId.value != null)
                      ListTile(
                        leading: Image.file(
                          assetData.artifactSets[secondSetId.value]!.consistsOf.values.first.getImageFile(assetDir),
                          width: 36,
                        ),
                        title: Text("${assetData.artifactSets[secondSetId.value]!.name.localized} (${tr.artifactDetailsPage.nSet(n: "2")})"),
                        trailing: TextButton(
                          onPressed: () {
                            screenState.value = _ScreenState.secondSetChooser;
                          },
                          child: Text(tr.common.change),
                        ),
                      ),
                    if (pieceId != null)
                      ListTile(
                        leading: Image.file(
                          ArtifactPiece.fromId(pieceId!, assetData).getImageFile(assetDir),
                          width: 36,
                        ),
                        title: Text(ArtifactPiece.fromId(pieceId!, assetData).name.localized),
                        subtitle: Text(_getPieceTypes(assetData)[0].desc.localized),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: GappedColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CharacterSelectDropdown(
                            label: tr.artifactDetailsPage.characterToEquip,
                            characters: characters,
                            value: characterToEquip.value,
                            onChanged: (value) {
                              characterToEquip.value = value;
                              characterDropdownError.value = null;
                            },
                            errorText: characterDropdownError.value,
                          ),

                          const SizedBox(),
                          // main stats
                          for (final pieceType in _getPieceTypes(assetData))
                            if (pieceType.possibleMainStats.length >= 2)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListSubheader(
                                    tr.artifactDetailsPage.mainStatWithPieceType(pieceType: pieceType.desc.localized),
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  ),
                                  if (pieceType.possibleMainStats.length >= 2)
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 4.0,
                                      children: [
                                        LabeledRadio(
                                          label: Text(tr.artifactDetailsPage.unspecified),
                                          value: null,
                                          groupValue: mainStats.value[pieceType.id],
                                          activeColor: Theme.of(context).colorScheme.secondary,
                                          onChanged: (value) {
                                            mainStats.value = {
                                              ...mainStats.value,
                                              pieceType.id: value,
                                            };
                                          },
                                        ),
                                        for (final stat in pieceType.possibleMainStats)
                                          LabeledRadio(
                                            label: Text((assetData.artifactStats[stat]?.localized).toString()),
                                            value: stat,
                                            groupValue: mainStats.value[pieceType.id],
                                            onChanged: (value) {
                                              mainStats.value = {
                                                ...mainStats.value,
                                                pieceType.id: value,
                                              };
                                            },
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                          const SizedBox(),

                          // sub stats
                          ListSubheader(
                            tr.artifactDetailsPage.subStats,
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                          ),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: [
                              for (final stat in assetData.artifactPossibleSubStats)
                                LabeledCheckBox(
                                  value: subStats.value.contains(stat),
                                  onChanged: (value) {
                                    if (value == true) {
                                      subStats.value = [...subStats.value, stat];
                                    } else {
                                      subStats.value = [...subStats.value..remove(stat)];
                                    }
                                  },
                                  child: Text((assetData.artifactStats[stat]?.localized).toString()),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  List<ArtifactPieceType> _getPieceTypes(AssetData assetData) {
    if (pieceId != null) {
      return [assetData.artifactPieceTypes[ArtifactPiece.fromId(pieceId!, assetData).type]!];
    } else {
      return assetData.artifactPieceTypes.values.toList();
    }
  }

  void _saveBookmark() {
    // TODO
  }
}

class SecondArtifactChooserScreen extends HookWidget {
  final AssetData assetData;
  final String assetDir;
  final String? excludedSetId;
  final String? selectedSetId;
  final void Function(String setId)? onSetSelected;

  const SecondArtifactChooserScreen({
    super.key,
    required this.assetData,
    required this.assetDir,
    this.excludedSetId,
    this.selectedSetId,
    this.onSetSelected,
  });

  @override
  Widget build(BuildContext context) {
    final artifactSets = useMemoized(() => assetData.artifactSets.values
        .where((set) => set.id != excludedSetId && set.bonuses.length >= 2).toList(),);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          sliver: SliverToBoxAdapter(
            child: Text(tr.artifactDetailsPage.chooseSecondSetDesc),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final artifactSet = artifactSets[index];
              return Material(
                child: ListTile(
                  leading: Image.file(
                    artifactSet.consistsOf.values.first.getImageFile(assetDir),
                    width: 36,
                  ),
                  title: Text(artifactSet.name.localized),
                  subtitle: StyleParsedText(
                    artifactSet.bonuses.firstWhere((e) => e.type == "2-pc").description.localized,
                    strongStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  selected: artifactSet.id == selectedSetId,
                  selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                  onTap: () {
                    onSetSelected?.call(artifactSet.id);
                  },
                ),
              );
            },
            childCount: artifactSets.length,
          ),
        ),
      ],
    );
  }
}

enum _ScreenState {
  secondSetChooser,
  artifactDetails,
}

Future<void> showArtifactBookmarkDialog({
  required BuildContext context,
  ArtifactSetId? firstSetId,
  ArtifactPieceId? pieceId,
  bool showSecondSetChooser = false,
}) async {
  await Navigator.push(
    context,
    adaptiveRoute(
      context: context,
      builder: (context) => ArtifactBookmarkDialog(
        firstSetId: firstSetId,
        pieceId: pieceId,
        showSecondSetChooser: showSecondSetChooser,
      ),
      fullscreenDialog: true,
    ),
  );
}
