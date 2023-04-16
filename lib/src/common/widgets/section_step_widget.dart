import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';

class SectionStepWidget extends StatelessWidget {
  const SectionStepWidget({
    super.key,
    required this.section,
    required this.formGroupTemplate,
  });
  final Section section;
  final FormGroup formGroupTemplate;
  @override
  Widget build(BuildContext context) {
    if ((section.items?.isNotEmpty ?? false) ||
        (section.children?.isNotEmpty ?? false)) {
      return Card(
        child: Column(
          children: [
            ...section.items?.map((e) {
                  if (e.label != null) {
                    return ListTile(
                      title: AutoSizeText(e.label ?? ''),
                    );
                  } else {
                    return const SizedBox();
                  }
                }).toList() ??
                [],
            ...section.children
                    ?.map((e) => SectionStepWidget(
                        section: e, formGroupTemplate: formGroupTemplate))
                    .toList() ??
                [],
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
