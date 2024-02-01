import "package:flutter/material.dart";
import "package:genshin_material/pages/home.dart";
import "package:go_router/go_router.dart";

final routes = <GoRoute>[
  GoRoute(
    path: "/",
    pageBuilder: (context, state) {
      return const MaterialPage(child: HomePage());
    },
  ),
];
