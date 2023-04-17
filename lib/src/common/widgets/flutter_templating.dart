import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlutterTemplating extends InheritedWidget {
  FlutterTemplating({
    super.key,
    required Widget child,
  }) : super(
            child: ProviderScope(
                child:
                    child)); // riverpod initialize, package depends on riverpod
  static FlutterTemplating? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlutterTemplating>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
