import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'core_template_render_widget.dart';
import 'custom_main_text.dart';
import 'title_description_widget.dart';

class ArrayField<T> extends ConsumerWidget {
  final String title;
  final String? description;
  final FormArray<T> formArray;
  final Widget Function(AbstractControl<T> control, int index) fieldBuilder;
  final IconData addButtonIcon;

  const ArrayField({
    super.key,
    required this.title,
    this.description,
    required this.formArray,
    required this.fieldBuilder,
    this.addButtonIcon = Icons.add,
  });

  @override
  Widget build(context, ref) {
    return StatefulBuilder(builder: (context, set) {
      // final hasError = formArray.errors.isNotEmpty;
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescriptionWidget(
              title: title,
              description: description,
            ),
            ref.read(templateRenderInputProvider).defaultGapColumn,
            ...formArray.controls.asMap().entries.map((entry) {
              final index = entry.key;
              final control = entry.value;
              return Row(
                // unique key because otherwise some bugs could occur
                key: UniqueKey(),
                children: [
                  fieldBuilder(control, index)
                      .padding(ref
                          .read(templateRenderInputProvider)
                          .defaultPaddingWidgets)
                      .expandIntoColumnOrRow(),
                  ref.read(templateRenderInputProvider).defaultGapRow,
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      set(() => formArray.removeAt(index));
                    },
                  ),
                ],
              );
            }).toList(),
            ref.read(templateRenderInputProvider).defaultGapColumn,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomMainText(
                  ref.read(templateRenderInputProvider).buttonAddFieldToSection,
                  expandIntoColumnOnRow: false,
                ),
                ref.read(templateRenderInputProvider).defaultGapRow,
                IconButton(
                  onPressed: () {
                    set(() => formArray.add(FormControl<T>()));
                  },
                  icon: Icon(addButtonIcon),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
