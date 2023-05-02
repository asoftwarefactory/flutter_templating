import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'section_field_widget.dart';
import 'title_description_widget.dart';

class SectionStepWidget extends ConsumerWidget {
  const SectionStepWidget({
    super.key,
    required this.section,
    required this.formGroupTemplate,
  });
  final Section section;
  final FormGroup formGroupTemplate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // hidden Feature
    if (section.hidden == true) {
      return const SizedBox();
    } else {
      return _buildField(context, ref);
    }
  }

  Widget _buildField(BuildContext context, WidgetRef ref) {
    if (section.type == SectionType.FIELD) {
      return SectionFieldWidget(
        section: section,
        formGroup: formGroupTemplate,
      ).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    } else if (section.type == SectionType.GROUP) {
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
                      title: section.names
                              ?.getDescriptionLabelTranslated(context) ??
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
                            child: SectionStepWidget(
                              formGroupTemplate: formGroupTemplate,
                              section: e,
                            ),
                          ),
                        ),
                        child: SectionStepWidget(
                          formGroupTemplate: formGroupTemplate,
                          section: e,
                        ),
                      );
                    }).toList() ??
                    [],
            ],
          ),
        ).createMargin(
            ref.read(templateRenderInputProvider).defaultMarginWidgets);
      });
    } else {
      return const SizedBox();
    }
  }
}
