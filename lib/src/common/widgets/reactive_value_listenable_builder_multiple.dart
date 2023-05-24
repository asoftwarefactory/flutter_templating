import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';
import '../extensions/abstract_control.dart';

class ReactiveValueListenableBuilderMultiple<T> extends StatelessWidget {
  final List<ReactiveValueListenableBuilderMultipleData<T>> controls;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) builder;
  final VoidCallback? onValueChanged;

  const ReactiveValueListenableBuilderMultiple({
    super.key,
    required this.controls,
    required this.child,
    required this.builder,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: MergeStream(
        controls.map((c) => ExtAbstractControl.getControl(context,
                formControlName: c.formControlName, formControl: c.formControl)
            .valueChanges),
      ).doOnData((data) => onValueChanged?.call()),
      builder: (context, snapshot) => builder(context, child),
    );
  }
}

class ReactiveValueListenableBuilderMultipleData<T> {
  final String? formControlName;
  final AbstractControl<T>? formControl;

  const ReactiveValueListenableBuilderMultipleData({
    this.formControlName,
    this.formControl,
  });
}
