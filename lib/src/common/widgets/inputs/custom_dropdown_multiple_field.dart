import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';

// TODO :
class ReactiveDropdownMultipleField<T>
    extends ReactiveFormField<List<T>, List<T>> {
  ReactiveDropdownMultipleField(
      {super.key,
      required FormControl<List<T>> control,
      required Section section

      //ValidationMessagesFunction<List<T>>? validationMessages,
      })
      : super(
          formControl: control,
          //validationMessages: validationMessages,
          builder: (ReactiveFormFieldState<List<T>, List<T>> field) {
            List<String> selected = [];
            return StatefulBuilder(builder: (context, set) {
              return DropDownMultiSelect(
                onChanged: (List<String> x) {
                  set(() {
                    selected = x;
                  });
                },
                options: const ['a', 'b', 'c', 'd'],
                selectedValues: selected,
                whenEmpty: 'Select Something',
              );
            });
          },
        );
}
