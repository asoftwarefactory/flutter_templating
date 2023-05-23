import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import '../models/template.dart';
import 'section_step_widget.dart';
import 'title_description_widget.dart';

class SectionGroupWidget extends ConsumerWidget {
  final Section section;
  final FormGroup form;
  const SectionGroupWidget({
    required this.section,
    required this.form,
    super.key,
  });

  @override
  Widget build(context, ref) {
    bool expanded = true;
    return StatefulBuilder(builder: (context, reload) {
      return Card(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                reload(() {
                  expanded = !expanded;
                });
              },
              child: Row(
                children: [
                  TitleDescriptionWidget(
                    title:
                        section.names?.getDescriptionLabelTranslated(context) ??
                            '',
                    description: section.descriptions
                        ?.getDescriptionLabelTranslated(context),
                  ).expandIntoColumnOrRow(),
                  Icon(expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
            ref.read(templateRenderInputProvider).defaultGapColumn,
            if (expanded)
              ...section.children?.map((e) {
                    // readonly feature
                    return Visibility(
                      visible: (section.readonly ?? false) == false,
                      replacement: IgnorePointer(
                        ignoring: true,
                        child: Opacity(
                          opacity: 0.5,
                          child: SectionStepWidget(section: e, mainForm: form),
                        ),
                      ),
                      child: SectionStepWidget(section: e, mainForm: form),
                    );
                  }).toList() ??
                  [],
          ],
        ),
      ).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    });
  }
}
