import 'package:collection/collection.dart';
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
  final T Function(Item)? valueFromSectionItem;

  const MultiSelectDropdownField({
    super.key,
    required this.control,
    required this.section,
    this.valueFromSectionItem,
  });
  bool get _readOnly {
    return section.readonly == true;
  }

  @override
  Widget build(context, ref) {
    return IgnorePointer(
      ignoring: _readOnly == true,
      child: Opacity(
        opacity: _readOnly ? 0.5 : 1,
        child: ReactiveDropdownMultipleField<T, T>(
          readOnly: _readOnly,
          control: control,
          whenEmpty: section.names?.getDescriptionLabelTranslated(context),
          labelBuilder: (options, value) {
            final item =
                (section.items ?? []).firstWhereOrNull((e) => e.key == value);
            return item?.label ?? '';
          },
          options: (section.items ?? [])
              .map((e) => valueFromSectionItem?.call(e) ?? e.key as T)
              .toList(),
        ),
      ),
    );
  }
}
