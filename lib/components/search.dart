import "package:animations/animations.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:material_symbols_icons/material_symbols_icons.dart";

import "list_tile.dart";

typedef SearchResultItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

typedef SearchQueryCallback<T> = List<T> Function(String query);

class SearchButton<T> extends StatelessWidget {
  final SearchResultItemBuilder<T> resultItemBuilder;
  final SearchQueryCallback<T> queryCallback;

  const SearchButton({
    super.key,
    required this.resultItemBuilder,
    required this.queryCallback,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => IconButton(
        icon: Icon(Symbols.search),
        onPressed: action,
      ),
      closedColor: Colors.transparent,
      closedShape: CircleBorder(),
      closedElevation: 0,
      openBuilder: (context, action) => _SearchPage(
        resultItemBuilder: resultItemBuilder,
        queryCallback: queryCallback,
      ),
      openElevation: 0,
    );
  }
}

class _SearchPage<T> extends HookWidget {
  final SearchResultItemBuilder<T> resultItemBuilder;
  final SearchQueryCallback<T> queryCallback;

  const _SearchPage({
    super.key,
    required this.resultItemBuilder,
    required this.queryCallback,
  });

  @override
  Widget build(BuildContext context) {
    final queryController = useTextEditingController();
    final query = useListenable(queryController).text;
    final results = queryCallback(query);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: queryController,
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Symbols.search),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) =>
            resultItemBuilder(context, results[index]),
      ),
    );
  }
}

class SearchResultListTile extends StatelessWidget {
  final Widget image;
  final String title;
  final String location;

  const SearchResultListTile({
    super.key,
    required this.image,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleListTile(
      leading: image,
      title: title,
      trailingIcon: Symbols.chevron_right,
      onTap: () {
        context.pop();
        context.push(location);
      },
    );
  }
}

