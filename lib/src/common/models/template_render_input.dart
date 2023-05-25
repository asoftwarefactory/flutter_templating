import 'package:flutter/material.dart';
import '../utils/app_sizes.dart';
import 'template.dart';

class TemplateRenderInput {
  final Template template;
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

  /// Authentication API service;
  late final String _bearerAccessToken;
  final String authorityId;

  /// example : https://api-dev.smartpa.cloud/portico/v1/;
  final String apiBaseUrl;

  /// calculate the url of the output autocomplete
  final String Function(String baseUrl, String partOfTheUrlOutput)? urlOutput;

  TemplateRenderInput({
    required this.template,
    this.defaultPaddingWidgets = const EdgeInsets.all(Sizes.p4),
    this.defaultMarginWidgets = const EdgeInsets.all(Sizes.p8),
    this.buttonPickFileText = "Pick File",
    this.buttonSaveTemplateText = "Save Template",
    this.buttonAddFieldToSection = "Add Field",
    this.onTemplateFormSend,
    this.defaultGapRow = gapW4,
    this.defaultGapColumn = gapH4,
    this.defaultFontSize = Sizes.p16,
    this.primaryFontSize = Sizes.p20,
    this.secondaryFontSize = Sizes.p12,
    required String bearerAccessToken,
    required this.authorityId,
    required this.apiBaseUrl,
    this.urlOutput,
  }) {
    String bearer = bearerAccessToken;
    bearer = bearer.trim();
    if (bearer.startsWith("Bearer ") == false) {
      bearer = "Bearer $bearer";
    }
    _bearerAccessToken = bearer;
  }

  String get bearerAccessToken => _bearerAccessToken;
}
