import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final String locale;
  CurrencyInputFormatter({
    required this.locale,
  });
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(locale).format(double.parse(s));

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      final string = _formatNumber(newValue.text.replaceAll(',', ''));
      return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length),
      );
    } catch (e) {
      return newValue.copyWith();
    }
  }
}
