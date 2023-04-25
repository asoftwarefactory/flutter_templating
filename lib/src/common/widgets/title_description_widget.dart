import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../utils/app_sizes.dart';
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
    return Column(children: [
      CustomMainText(
        title,
      ).row().padding(const EdgeInsets.all(Sizes.p4)),
      if (description != null)
        CustomMainText(
          description!,
        ).row().padding(const EdgeInsets.all(Sizes.p4)),
    ]);
  }
}
