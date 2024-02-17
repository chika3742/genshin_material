import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.bookmarks),
      ),
      body: const Placeholder(),
    );
  }
}
