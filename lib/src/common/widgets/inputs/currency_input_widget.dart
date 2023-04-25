import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../locale/locale.dart';
import '../../models/template.dart';
import 'formatters/currency.dart';

class CurrencyInputWidget extends StatelessWidget {
  const CurrencyInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<double> control;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      readOnly: section.readonly ?? false,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(locale: getAppLocale(context).languageCode)
      ],
      decoration: InputDecoration(
        prefixText: NumberFormat.compactSimpleCurrency(
                locale: getAppLocale(context).languageCode)
            .currencySymbol,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: AutoSizeText(
            section.names?.getDescriptionLabelTranslated(context) ?? ''),
        hintText: section.names?.getDescriptionLabelTranslated(context) ?? '',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      formControl: control,
    );
  }
}
