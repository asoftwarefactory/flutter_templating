import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/template_render_input.dart';
import 'core_template_render_widget.dart';

class CustomMainText extends ConsumerWidget {
  final String text;
  final TextSize size;
  final int maxLines;

  const CustomMainText(
    this.text, {
    Key? key,
    this.size = TextSize.normal,
    this.maxLines = 100000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        child: AutoSizeText(
          overflow: TextOverflow.visible,
          text,
          // I don't want to have a limit on rows
          maxLines: maxLines,

          style: TextStyle(
            fontSize: getFontSize(ref.read(templateRenderInputProvider)),
          ),
        ),
      );
    });
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
