import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../models/template_render_input.dart';
import 'core_template_render_widget.dart';

class CustomMainText extends ConsumerWidget {
  final String? text;
  final TextSize size;
  final int maxLines;
  final bool expandIntoColumnOnRow;

  const CustomMainText(
    this.text, {
    Key? key,
    this.expandIntoColumnOnRow = true,
    this.size = TextSize.normal,
    // I don't want to have a limit on rows
    this.maxLines = 100000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textW = AutoSizeText(
      overflow: TextOverflow.ellipsis,
      text ?? '',
      maxLines: maxLines,
      style: TextStyle(
        fontSize: getFontSize(ref.read(templateRenderInputProvider)),
      ),
    );
    if (expandIntoColumnOnRow) {
      return textW.expandIntoColumnOrRow();
    }
    return textW;
  }

  double getFontSize(TemplateRenderInput input) {
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
}

enum TextSize { normal, small, large }
