import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "../../../components/data_asset_scope.dart";
import "../../../components/layout.dart";
import "../../../components/style_parsed_text.dart";
import "../../../i18n/strings.g.dart";
import "../../../routes.dart";

class ArtifactListPage extends HookWidget {
  const ArtifactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final expandedIndices = useState(<int>{});

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.artifacts),
      ),
      body: DataAssetScope(
        builder: (assetData, assetDir) {
          final sets = assetData.artifactSets;

          return SingleChildScrollView(
            child: Column(
              children: [
                // expand/collapse all buttons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: GappedRow(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          expandedIndices.value = <int>{
                            ...List.generate(sets.length, (index) => index),
                          };
                        },
                        icon: const Icon(Symbols.expand_all),
                        label: Text(tr.common.expandAll),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          expandedIndices.value = <int>{};
                        },
                        icon: const Icon(Symbols.collapse_all),
                        label: Text(tr.common.collapseAll),
                      ),
                    ],
                  ),
                ),

                ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    if (isExpanded) {
                      expandedIndices.value = {...expandedIndices.value}..add(index);
                    } else {
                      expandedIndices.value = {...expandedIndices.value}..remove(index);
                    }
                  },
                  children: [
                    for (int i = 0; i < sets.length; i++)
                      ExpansionPanel(
                        isExpanded: expandedIndices.value.contains(i),
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            leading: Image.file(
                              sets[i].consistsOf[0].getImageFile(assetDir),
                              height: 40,
                              width: 40,
                            ),
                            title: Text(sets[i].name.localized),
                            trailing: const Icon(Icons.loupe),
                            onTap: () {
                              ArtifactDetailsRoute(id: sets[i].id).push(context);
                            },
                          );
                        },
                        body: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                            child: GappedColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (final bonus in sets[i].bonuses) ...[
                                  Text(
                                    tr.artifactsPage.bonusTypes[bonus.type]!,
                                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: StyleParsedText(
                                      bonus.description.localized,
                                      strongStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
          // return ListView.builder(
          //   itemCount: assetData.artifactSets!.length,
          //   itemBuilder: (context, index) {
          //     final artifact = assetData.artifactSets![index];
          //     return ExpansionTile(
          //       title: Text(artifact.name.localized),
          //       expandedCrossAxisAlignment: CrossAxisAlignment.start,
          //       expansionAnimationStyle: AnimationStyle(
          //         curve: Curves.easeOutQuint,
          //         reverseCurve: Curves.easeInQuint,
          //         duration: const Duration(milliseconds: 300),
          //       ),
          //       children: [
          //         for (final piece in artifact.consistsOf)
          //           ListTile(
          //             leading: Image.file(
          //               piece.getImageFile(assetData.assetDir!),
          //               height: 48,
          //               width: 48,
          //             ),
          //             title: Text(piece.name.localized),
          //           ),
          //       ],
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
