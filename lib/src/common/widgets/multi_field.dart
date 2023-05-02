import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'core_template_render_widget.dart';

class MultiField<T, DT> extends ConsumerWidget {
  final List<ReactiveFormField<T, DT>> fields;
  final ReactiveFormField<T, DT> Function() fieldBuilder;
  final FormControl<List<T>> control;
  const MultiField({
    required this.fieldBuilder,
    required this.control,
    super.key,
    required this.fields,
  });

  @override
  Widget build(context, ref) {
    return Builder(
      builder: (context) {

        return StatefulBuilder(builder: (context, set) {
          return Column(
            children: [
              ...fields.map((e) => e).toList(),
              ref.read(templateRenderInputProvider).defaultGapColumn,
              buildButtonAddField(onPressed: () {
                set(() {
                  final field = fieldBuilder();
                  fields.add(field);
                  /* control = 
                  control.value= co */
                });
              }),
            ],
          );
        });
      }
    );
  }

  Widget buildButtonAddField({required void Function()? onPressed}) {
    return IconButton(
      icon: const Icon(Icons.add_box),
      onPressed: onPressed,
    );
  }
}
