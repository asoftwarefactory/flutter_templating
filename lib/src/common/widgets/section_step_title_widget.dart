import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';

class SectionStepTitleWidget extends StatelessWidget {
  const SectionStepTitleWidget({super.key, required this.section});
  final Section section;

  @override
  Widget build(BuildContext context) {
    if (section.name != null) {
      return AutoSizeText(section.name!);
    } else {
      return const SizedBox();
    }
  }
}
