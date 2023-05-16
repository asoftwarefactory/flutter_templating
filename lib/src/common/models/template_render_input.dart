import 'package:flutter/material.dart';
import '../utils/app_sizes.dart';
import 'base_autocomplete.dart';

class TemplateRenderInput {
  final EdgeInsets defaultPaddingWidgets;
  final EdgeInsets defaultMarginWidgets;
  final String buttonPickFileText;
  final String buttonSaveTemplateText;
  final String buttonAddFieldToSection;
  final Future<void> Function(Object? data)? onTemplateFormSend;
  final SizedBox defaultGapRow;
  final SizedBox defaultGapColumn;
  final double defaultFontSize;
  final double primaryFontSize;
  final double secondaryFontSize;
  final Future<List<BaseAutocomplete>> Function()? autocompletesLoader;

  const TemplateRenderInput({
    this.primaryFontSize = Sizes.p20,
    this.secondaryFontSize = Sizes.p12,
    this.defaultFontSize = Sizes.p16,
    this.defaultGapRow = gapW4,
    this.defaultGapColumn = gapH4,
    this.defaultPaddingWidgets = const EdgeInsets.all(Sizes.p4),
    this.defaultMarginWidgets = const EdgeInsets.all(Sizes.p8),
    this.buttonPickFileText = "Pick File",
    this.buttonSaveTemplateText = "Save Template",
    this.buttonAddFieldToSection = "Add Field",
    this.onTemplateFormSend,
     this.autocompletesLoader,
  });
}
