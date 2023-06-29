import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class DropdownField<T> extends ConsumerWidget implements InputField {
  final FormControl<T> control;
  final Section section;
  final T Function(Item)? valueFromSectionItem;
  final List<Item> items;

  const DropdownField({
    super.key,
    required this.control,
    required this.section,
    required this.items,
    this.valueFromSectionItem,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (ctx, ref, _) => Row(
        children: [
          ReactiveDropdownField<T>(
            hint: CustomMainText(
              section.descriptions?.getDescriptionLabelTranslated(context) ??
                  section.names?.getDescriptionLabelTranslated(context),
              expandIntoColumnOnRow: false,
              inputRef: ref,
            ),
            readOnly: section.readonly == true,
            formControl: control,
            items: items.map((e) {
              return DropdownMenuItem<T>(
                value: valueFromSectionItem?.call(e) ?? e.key,
                child: CustomMainText(
                  e.label,
                  expandIntoColumnOnRow: false,
                  inputRef: ref,
                ),
              );
            }).toList(),
          ).expandIntoColumnOrRow(),
          IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () {
              control.value = null;
            },
          ),
        ],
      ),
    );
  }
}
