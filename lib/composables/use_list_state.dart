import "dart:collection";

import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";

/// A composable that provides a [ListChangeNotifier] for managing a list.
/// This allows you to rebuild widgets when the list changes.
ListChangeNotifier<T> useListState<T>(List<T> initialValue) {
  return use(_ListHook<T>(initialValue));
}

class _ListHook<T> extends Hook<ListChangeNotifier<T>> {
  const _ListHook(this.initialValue);

  final List<T> initialValue;

  @override
  HookState<ListChangeNotifier<T>, Hook<ListChangeNotifier<T>>> createState() {
    return _ListHookState<T>();
  }
}

class _ListHookState<T> extends HookState<ListChangeNotifier<T>, _ListHook<T>> {
  late final _state = ListChangeNotifier(hook.initialValue)..addListener(_listener);

  @override
  ListChangeNotifier<T> build(BuildContext context) => _state;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  String get debugLabel => "useListState<$T>";
}

class ListChangeNotifier<T> extends ChangeNotifier with ListMixin<T> {
  ListChangeNotifier(List<T> items) : _items = List.of(items);

  final List<T> _items;

  @override
  int get length => _items.length;

  @override
  set length(int newLength) {
    throw UnimplementedError("Setting length directly is not supported.");
  }

  @override
  T operator [](int index) => _items[index];

  @override
  void operator []=(int index, T value) {
    _items[index] = value;
    notifyListeners();
  }

  @override
  void add(T element) {
    _items.add(element);
    notifyListeners();
  }

  @override
  bool remove(Object? element) {
    final result = _items.remove(element);
    notifyListeners();
    return result;
  }
}
