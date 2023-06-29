import 'package:flutter_riverpod/flutter_riverpod.dart';

class IterableNotifier<T> extends StateNotifier<List<T>> {
  IterableNotifier({List<T> state = const []}) : super(state);

  void set(List<T> items) {
    state = items;
  }

  void add(List<T> items) {
    state = [...state, ...items];
  }

  void clearAll() {
    state = [];
  }

  void clear(T item) {
    final copyItems = state;
    copyItems.removeAt(copyItems.indexOf(item));
    state = copyItems;
  }

  List<T> get elements => state;
}
