import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';

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

/* 
class ReactiveDropDownMultiSelect<T>
    extends ReactiveFormField<List<T>, List<T>> {
  final List<T> items;
  final String Function(T) itemAsString;

  ReactiveDropDownMultiSelect({
    super.key,
    required String formControlName,
    required this.items,
    required this.itemAsString,
    Map<String, String Function(Object)>? validationMessages,
  }) : super(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (ReactiveFormFieldState<List<T>, List<T>> field) {
            return DropdownMultiSelect<T>(
              items: items,
              selectedValues: field.value ?? [],
              onChanged: field.didChange,
              itemAsString: itemAsString,
            );
          },
        );

  @override
  ReactiveFormFieldState<List<T>, List<T>> createState() =>
      ReactiveFormFieldState<List<T>, List<T>>();
}

class DropdownMultiSelect<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedValues;
  final Function(List<T>?) onChanged;
  final String Function(T) itemAsString;

  const DropdownMultiSelect({
    super.key,
    required this.items,
    required this.selectedValues,
    required this.onChanged,
    required this.itemAsString,
  });

  @override
  DropdownMultiSelectState<T> createState() => DropdownMultiSelectState<T>();
}

class DropdownMultiSelectState<T> extends State<DropdownMultiSelect<T>> {
  List<T> _selectedValues = [];

  @override
  void initState() {
    super.initState();

    _selectedValues = widget.selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.itemAsString(item)),
        );
      }).toList(),
      value: _selectedValues,
      onChanged: (value) {
        setState(() {
          _selectedValues = value?.map((item) => item as T)?.toList() ?? [];
        });
        widget.onChanged(value?.map((item) => item as T)?.toList());
      },
      decoration: const InputDecoration(
        labelText: 'Select Items',
        border: OutlineInputBorder(),
      ),
      isDense: true,
      isExpanded: true,
      selectedItemBuilder: (BuildContext context) {
        return _selectedValues.map((item) {
          return Text(widget.itemAsString(item));
        }).toList();
      },
      // selectedItemBuilderPadding: EdgeInsets.zero,
      dropdownColor: Colors.white,
      elevation: 8,
      // multiple: true,
    );
  }
}*/
 