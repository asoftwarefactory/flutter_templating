import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../enums/text_size.dart';
import '../utils/get_font_size_from_template_render_input.dart';
import 'core_template_render_widget.dart';

class CustomMainText extends ConsumerWidget {
  final String? text;
  final TextSize size;
  final int maxLines;
  final bool expandIntoColumnOnRow;
  final WidgetRef? inputRef;

  const CustomMainText(
    this.text, {
    Key? key,
    this.expandIntoColumnOnRow = true,
    this.size = TextSize.normal,
    // I don't want to have a limit on rows
    this.maxLines = 100000,
    this.inputRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textW = AutoSizeText(
      overflow: TextOverflow.ellipsis,
      text ?? '',
      maxLines: maxLines,
      style: TextStyle(
        fontSize: getFontSize(
            size,
            inputRef?.read(templateRenderInputProvider) ??
                ref.read(templateRenderInputProvider)),
      ),
    );
    if (expandIntoColumnOnRow) {
      return textW.expandIntoColumnOrRow();
    }
    return textW;
  }

  static Text createText(
    String? text, {
    Key? key,
    TextSize size = TextSize.normal,
    // I don't want to have a limit on rows
    int maxLines = 100000,
    required WidgetRef inputRef,
  }) {
    return Text(
      key: key,
      text ?? '',
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: getFontSize(
          size,
          inputRef.read(templateRenderInputProvider),
        ),
      ),
    );
  }
}
