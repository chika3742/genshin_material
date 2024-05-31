import "package:riverpod_annotation/riverpod_annotation.dart";

import "../database.dart";

part "database_provider.g.dart";

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
}
