import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_dropdown_multiple_field/reactive_dropdown_multiple_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../../models/template.dart';
import '../readonly.dart';
import 'input_field.dart';

class MultiSelectDropdownField<T> extends ConsumerWidget implements InputField {
  final FormControl<List<T>> control;
  final Section section;
  final String Function(T data, List<Item> allItems)? label;
  final Items items;

  const MultiSelectDropdownField({
    super.key,
    required this.control,
    required this.section,
    required this.items,
    this.label,
  });

  bool get _readOnly {
    return section.readonly == true;
  }

  List<T> get _typedSectionItems {
    return (items).map((e) => e.key as T).toList();
  }

  @override
  Widget build(context, ref) {
    return Readonly(
      readonly: _readOnly,
      child: ReactiveDropdownMultipleField<T>(
        readOnly: _readOnly,
        control: control,
        whenEmpty: section.names?.getDescriptionLabelTranslated(context),
        options: _typedSectionItems,
        labelBuilder: (v) {
          return LabelBuilderData(
            enableIntoSelectedOptions: true,
            enableIntoOptions: true,
            label: label?.call(v, items) ?? v.toString(),
          );
        },
      ),
    );
  }
}
