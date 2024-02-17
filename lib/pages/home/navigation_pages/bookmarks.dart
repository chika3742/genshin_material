import "package:flutter/material.dart";

import "../../../i18n/strings.g.dart";

class BookmarksNavPage extends StatelessWidget {
  const BookmarksNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.homeNavDestinations.bookmarks),
      ),
      body: const Placeholder(),
    );
  }
}
