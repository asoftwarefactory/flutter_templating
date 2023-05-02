import '../enums/text_size.dart';
import '../models/template_render_input.dart';

double getFontSize(TextSize size, TemplateRenderInput input) {
  switch (size) {
    case TextSize.large:
      return input.primaryFontSize;
    case TextSize.normal:
      return input.defaultFontSize;
    case TextSize.small:
      return input.secondaryFontSize;
    default:
      return input.defaultFontSize;
  }
}


