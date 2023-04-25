import 'package:flutter/material.dart';
import '../utils/app_sizes.dart';

class TemplateRenderInput {
  final EdgeInsets defaultPaddingWidgets;
  final EdgeInsets defaultMarginWidgets;
  final String buttonPickFileText;
  final Future<void> Function(Map<String, dynamic> data)? onTemplateFormSend;
  final SizedBox defaultGapRow;
  final SizedBox defaultGapColumn;
  final double defaultFontSize;
  final double primaryFontSize;
  final double secondaryFontSize;

  const TemplateRenderInput({
    this.primaryFontSize = Sizes.p20,
    this.secondaryFontSize = Sizes.p12,
    this.defaultFontSize = Sizes.p16,
    this.defaultGapRow = gapW4,
    this.defaultGapColumn = gapH4,
    this.defaultPaddingWidgets = const EdgeInsets.all(Sizes.p4),
    this.defaultMarginWidgets = const EdgeInsets.all(Sizes.p4),
    this.buttonPickFileText = "Pick File",
    this.onTemplateFormSend,
  });
}
