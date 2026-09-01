import "package:flutter_riverpod/misc.dart";
import "package:genshin_material/core/pref_keys.dart";

import "in_memory_pref.dart";

/// Overrides the four preference keys that back `HoyolabCredential` in one go.
///
/// The defaults describe a fully linked account, so a test that only cares
/// about one of the values can pass just that one and still get a
/// `LinkedHoyolabCredential`. Passing null for any of them yields an
/// `UnlinkedHoyolabCredential`.
List<Override> overrideHoyolabCredentialPrefs({
  String? server = "os_asia",
  String? serverName = "Asia",
  String? userName = "tester",
  String? uid = "800000000",
}) {
  return [
    overridePref(PrefKeys.hyvServer, server),
    overridePref(PrefKeys.hyvServerName, serverName),
    overridePref(PrefKeys.hyvUserName, userName),
    overridePref(PrefKeys.hyvUid, uid),
  ];
}
