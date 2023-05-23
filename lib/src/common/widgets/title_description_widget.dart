import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../core/providers/providers.dart';
import '../enums/text_size.dart';
import 'custom_main_text.dart';

class TitleDescriptionWidget extends StatelessWidget {
  final String title;
  final String? description;
  const TitleDescriptionWidget({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTitleDescription(context);
  }

  Widget _buildTitleDescription(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, _) => Column(children: [
        CustomMainText(
          title,
          size: TextSize.large,
        ).row().padding(
            ref.read(templateRenderInputProvider).defaultPaddingWidgets),
        if (description != null)
          CustomMainText(
            description!,
          ).row().padding(
              ref.read(templateRenderInputProvider).defaultPaddingWidgets),
      ]),
    );
  }
}
