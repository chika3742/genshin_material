import "dart:io";

import "package:drift/remote.dart";

import "../core/asset_updater.dart";
import "../core/errors.dart";
import "../core/hoyolab_api.dart";
import "../core/secure_storage.dart";
import "../i18n/strings.g.dart";

String getErrorMessage(Object? error, {String prefix = ""}) {
  return prefix + switch (error) {
    SchemaVersionMismatchException() => tr.updates.schemaVersionMismatch,
    AssetUpdateCheckException() => tr.errors.tryAgainLater,
    CredentialVerificationException() => tr.hoyolab.credentialVerificationFailed,
    SocketException() => tr.updates.noInternet,
    HoyolabApiException(:final retcode, :final originalMessage) => switch (retcode) {
      Retcode.characterDoesNotExist => tr.hoyolab.characterDoesNotExist,
      Retcode.dataNotPublic => tr.hoyolab.realtimeNotesNotEnabled,
      _ => "($originalMessage)",
    },
    DriftRemoteException() => tr.errors.dbError,
    NoCompatibleAssetException() => tr.updates.noCompatibleAsset,
    _ => "",
  };
}
