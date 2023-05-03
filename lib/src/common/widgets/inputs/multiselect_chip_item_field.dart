import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_multi_select_flutter/reactive_multi_select_flutter.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class MultiSelectChipItemField<T> extends ConsumerWidget implements InputField {
  final FormControl<List<T>> control;
  final Section section;

  const MultiSelectChipItemField({
    super.key,
    required this.control,
    required this.section,
  });

  @override
  Widget build(context, ref) {
    return IgnorePointer(
      ignoring: section.readonly == true,
      child: Opacity(
        opacity: section.readonly == true ? 0.5 : 1,
        child: ReactiveMultiSelectChipField<T, T>(
          searchable: section.searchable ?? false,
          title: CustomMainText.createText(
              section.descriptions?.getDescriptionLabelTranslated(context) ??
                  section.names?.getDescriptionLabelTranslated(context),
              inputRef: ref),
          formControl: control,
          items: (section.items ?? [])
              .map(
                (e) => MultiSelectItem<T>(e.key, e.label ?? ''),
              )
              .toList(),
        ),
      ),
    );
  }
}
