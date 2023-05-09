import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_dropdown_multiple_field/reactive_dropdown_multiple_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../../models/template.dart';
import 'input_field.dart';

class MultiSelectDropdownField<T> extends ConsumerWidget implements InputField {
  final FormControl<List<T>> control;
  final Section section;
  final String Function(T data, List<Item> allItems)? label;

  const MultiSelectDropdownField({
    super.key,
    required this.control,
    required this.section,
    this.label,
  });

  bool get _readOnly {
    return section.readonly == true;
  }

  List<Item> get _sectionItems {
    return section.items ?? [];
  }

  List<T> get _typedSectionItems {
    return (section.items ?? []).map((e) => e.key as T).toList();
  }

  @override
  Widget build(context, ref) {
    return IgnorePointer(
      ignoring: _readOnly,
      child: Opacity(
        opacity: _readOnly ? 0.5 : 1,
        child: ReactiveDropdownMultipleField<T>(
          readOnly: _readOnly,
          control: control,
          whenEmpty: section.names?.getDescriptionLabelTranslated(context),
          options: _typedSectionItems,
          labelBuilder: (v) {
            return LabelBuilderData(
              enableIntoSelectedOptions: true,
              enableIntoOptions: true,
              label: label?.call(v, _sectionItems) ?? v.toString(),
            );
          },
        ),
      ),
    );
  }
}
