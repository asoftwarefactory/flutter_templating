import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_raw_autocomplete/reactive_raw_autocomplete.dart';
import '../../models/template.dart';
import 'input_field.dart';

class AutocompleteInputWidget<T, D extends Object> extends StatelessWidget
    implements InputField {
  const AutocompleteInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<T> control;

  @override
  Widget build(BuildContext context) {
    return ReactiveRawAutocomplete<T, D>(
      readOnly: section.readonly == true,
      formControl: control,
      optionsBuilder: (value) async {
        return await Future.value(List<D>.from([]));
      },
      optionsViewBuilder: (ctx, fn, allOptions) {
        return const ListTile();
      },
    );
  }
}
