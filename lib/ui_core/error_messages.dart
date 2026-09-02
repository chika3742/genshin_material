import "dart:io";

import "package:drift/isolate.dart";

import "../core/asset_updater.dart";
import "../core/errors.dart";
import "../data/services/hoyolab/hoyolab_exceptions.dart";
import "../i18n/strings.g.dart";

String getErrorMessage(Object? error, {String prefix = ""}) {
  return prefix + switch (error) {
    SchemaVersionMismatchException() => tr.updates.schemaVersionMismatch,
    AssetUpdateCheckException() => tr.errors.tryAgainLater,
    CredentialVerificationException() => tr.hoyolab.credentialVerificationFailed,
    SocketException() => tr.updates.noInternet,
    HoyolabLinkDisabledException() => tr.errors.tryAgainLater,
    HoyolabNotSignedInException() => tr.hoyolab.loginExpired,
    HoyolabServerNotSelectedException() => tr.hoyolab.plsSelectServer,
    HoyolabApiException(:final retcode, :final originalMessage) => switch (retcode) {
      -502002 => tr.hoyolab.characterDataAccessNotAllowed,
      -502001 => tr.hoyolab.characterDoesNotExist,
      10102 => tr.hoyolab.realtimeNotesNotEnabled,
      -100 => tr.hoyolab.loginExpired,
      _ => "($originalMessage)",
    },
    DriftRemoteException() => tr.errors.dbError,
    NoCompatibleAssetException() => tr.updates.noCompatibleAsset,
    _ => "",
  };
}
