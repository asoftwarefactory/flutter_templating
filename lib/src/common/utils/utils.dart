import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../extensions/locale.dart';
import '../locale/locale.dart';
import '../models/template.dart';


// for the translation of the culture that comes from the server

String? getDescriptionOrNamesLabelTranslated(
  BuildContext context,
  List<Description> items,
) {
  return getDescriptionFromLocale(context, items)?.label;
}

Description? getDescriptionFromLocale(
  BuildContext context,
  List<Description> items, {
  Locale? locale,
}) {
  final l = locale ?? getAppLocale(context);
  final currentDescription = _getDescription(l, items);
  if (currentDescription != null) {
    return currentDescription;
  } else {
    return _getDescription(ExtLocale.getDefault, items);
  }
}

Description? _getDescription(Locale locale, List<Description> items) {
  return (items.firstWhereOrNull((element) =>
      element.culture?.toLowerCase() == locale.languageCode.toLowerCase()));
}
