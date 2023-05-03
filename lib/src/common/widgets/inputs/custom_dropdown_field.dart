import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class CustomDropdownField<T> extends ConsumerWidget implements InputField {
  final FormControl<T> control;
  final Section section;

  const CustomDropdownField({
    super.key,
    required this.control,
    required this.section,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (ctx, ref, _) => ReactiveDropdownField<T>(
        hint: CustomMainText(
          section.descriptions?.getDescriptionLabelTranslated(context) ??
              section.names?.getDescriptionLabelTranslated(context),
          expandIntoColumnOnRow: false,
          inputRef: ref,
        ),
        readOnly: section.readonly == true,
        formControl: control,
        items: (section.items ?? <Item>[]).map((e) {
          return DropdownMenuItem<T>(
            value: e.key,
            child: CustomMainText(
              e.label,
              expandIntoColumnOnRow: false,
              inputRef: ref,
            ),
          );
        }).toList(),
      ),
    );
  }
}
