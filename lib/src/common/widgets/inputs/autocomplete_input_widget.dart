import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_raw_autocomplete/reactive_raw_autocomplete.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class AutocompleteInputWidget<T, D extends Object> extends StatelessWidget
    implements InputField {
  final Section section;
  final FormControl<T> control;
  final Future<Iterable<D>> Function(TextEditingValue) optionsBuilder;
  final String Function(D)? displayStringForOption;
  const AutocompleteInputWidget({
    Key? key,
    required this.section,
    required this.control,
    required this.optionsBuilder,
    this.displayStringForOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveRawAutocomplete<T, D>(
      readOnly: section.readonly == true,
      enableInteractiveSelection: true,
      formControl: control,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: section.names?.getDescriptionLabelTranslated(context),
        hintText: section.descriptions?.getDescriptionLabelTranslated(context),
      ),
      optionsBuilder: optionsBuilder,
      displayStringForOption:
          displayStringForOption ?? RawAutocomplete.defaultStringForOption,
      optionsViewBuilder: (ctx, onSelected, options) {
        return Align(
          key: UniqueKey(),
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  final label = (displayStringForOption ??
                          RawAutocomplete.defaultStringForOption)
                      .call(option);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title:
                          CustomMainText(label, expandIntoColumnOnRow: false),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
