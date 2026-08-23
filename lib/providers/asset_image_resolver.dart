import "dart:io";

import "package:path/path.dart" as path;
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../models/common.dart";
import "miscellaneous.dart";
import "versions.dart";

part "asset_image_resolver.g.dart";

class AssetImageResolver {
  final bool disableImages;
  final String assetPath;

  const AssetImageResolver({required this.assetPath, required this.disableImages});

  File getFile(HasImage source) => _resolve(source.imageUrl);
  File getSmallFile(HasSmallImage source) => _resolve(source.smallImageUrl);

  File _resolve(String url) =>
      File(disableImages ? getBlankImagePath(assetPath) : path.join(assetPath, url));

  @override
  bool operator ==(Object other) {
    return other is AssetImageResolver
        && other.disableImages == disableImages
        && other.assetPath == assetPath;
  }

  @override
  int get hashCode => Object.hash(disableImages, assetPath);
}

@riverpod
AssetImageResolver assetImageResolver(Ref ref) {
  return AssetImageResolver(
    assetPath: ref.watch(assetDataProvider).requireValue.assetDir,
    disableImages: ref.watch(shouldHideImagesProvider),
  );
}
