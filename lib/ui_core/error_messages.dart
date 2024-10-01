import "dart:io";

import "../core/asset_updater.dart";
import "../core/secure_storage.dart";
import "../i18n/strings.g.dart";

String getErrorMessage(Object error, {String prefix = ""}) {
  return prefix + switch (error) {
    SchemaVersionMismatchException() => tr.updates.schemaVersionMismatch,
    AssetUpdateCheckException() => tr.errors.tryAgainLater,
    CredentialVerificationException() => tr.hoyolab.credentialVerificationFailed,
    SocketException() => tr.updates.noInternet,
    _ => "",
  };
}
