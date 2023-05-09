import 'package:flutter/widgets.dart';

class Readonly extends StatelessWidget {
  final bool readonly;
  final Widget child;
  const Readonly({
    super.key,
    required this.child,
    this.readonly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: readonly ? 0.5 : 1,
      child: IgnorePointer(
        ignoring: readonly,
        child: child,
      ),
    );
  }
}
