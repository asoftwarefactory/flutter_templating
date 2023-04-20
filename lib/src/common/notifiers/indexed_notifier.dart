import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexedNotifier extends StateNotifier<int> {
  IndexedNotifier({int index = 0}) : super(index);

  void increment() {
    state += 1;
  }

  void decrement() {
    state -= 1;
  }

  void set(int index) {
    state = index;
  }
}
