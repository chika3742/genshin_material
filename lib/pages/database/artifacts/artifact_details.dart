import "package:collection/collection.dart";
import "package:flutter/material.dart";

import "../../../components/center_text.dart";
import "../../../components/data_asset_scope.dart";
import "../../../i18n/strings.g.dart";

class ArtifactDetailsPage extends StatelessWidget {
  final String id;

  const ArtifactDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DataAssetScope(
      wrapCenterTextWithScaffold: true,
      builder: (assetData) {
        final artifact = assetData.artifactSets!
            .firstWhereOrNull((element) => element.id == id);
        if (artifact == null) {
          return Scaffold(
            appBar: AppBar(),
            body: CenterError(tr.errors.artifactNotFound),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(tr.pages.artifactDetails(artifact: artifact.name.localized)),
          ),
          body: const Placeholder(),
        );
      },
    );
  }
}
