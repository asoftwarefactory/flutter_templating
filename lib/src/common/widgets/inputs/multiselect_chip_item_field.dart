import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_multi_select_flutter/reactive_multi_select_flutter.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import '../readonly.dart';
import 'input_field.dart';

class MultiSelectChipItemField<T> extends ConsumerWidget implements InputField {
  final FormControl<List<T>> control;
  final Section section;
  final T Function(Item)? valueFromSectionItem;
  final Items items;

  const MultiSelectChipItemField({
    super.key,
    required this.control,
    required this.section,
    required this.items,
    this.valueFromSectionItem,
  });

  @override
  Widget build(context, ref) {
    return Readonly(
      readonly: section.readonly == true,
      child: ReactiveMultiSelectChipField<T, T>(
        searchable: true,
        title: CustomMainText.createText(
            section.descriptions?.getDescriptionLabelTranslated(context) ??
                section.names?.getDescriptionLabelTranslated(context),
            inputRef: ref),
        formControl: control,
        items: items
            .map(
              (e) => MultiSelectItem<T>(
                valueFromSectionItem?.call(e) ?? e.key,
                e.label ?? '',
              ),
            )
            .toList(),
      ),
    );
  }
}
