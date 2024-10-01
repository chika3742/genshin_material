import "dart:io";

import "../core/asset_updater.dart";
import "../i18n/strings.g.dart";

String getErrorMessage(Object error, {String prefix = ""}) {
  return prefix + switch (error) {
    SchemaVersionMismatchException() => tr.updates.schemaVersionMismatch,
    AssetUpdateCheckException() => tr.errors.tryAgainLater,
    SocketException() => tr.updates.noInternet,
    _ => "",
  };
}
