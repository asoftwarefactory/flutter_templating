import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../locale/locale.dart';
import '../models/template.dart';
import 'locale.dart';

extension ExtListDescription on List<Description> {
  // for the translation of the culture that comes from the server

  String? getDescriptionLabelTranslated(BuildContext context) {
    return getDescriptionFromLocale(context)?.label;
  }

  Description? getDescriptionFromLocale(
    BuildContext context, {
    Locale? locale,
  }) {
    final l = locale ?? getAppLocale(context);
    final currentDescription = _getDescription(l, this);
    if (currentDescription != null) {
      return currentDescription;
    } else {
      return _getDescription(ExtLocale.getDefault, this);
    }
  }

  Description? _getDescription(Locale locale, List<Description> items) {
    return (items.firstWhereOrNull((element) =>
        element.culture?.toLowerCase() == locale.languageCode.toLowerCase()));
  }
}
