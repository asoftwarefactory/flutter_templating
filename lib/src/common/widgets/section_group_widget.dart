import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/abstract_control.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import 'custom_main_text.dart';
import 'section_step_widget.dart';
import 'title_description_widget.dart';

class SectionGroupWidget extends ConsumerWidget {
  final Section section;
  const SectionGroupWidget({required this.section, super.key});

  @override
  Widget build(context, ref) {
    final templateRenderInput = ref.read(templateRenderInputProvider);
    final mainForm = ref.read(mainFormProvider);
    // section group is multiple
    if (section.isMultiple) {
      final sectionGroupFormArray =
          ExtAbstractControl.controlNested(section.id, mainForm) as FormArray;
      return ReactiveValueListenableBuilder(
        formControl: sectionGroupFormArray,
        builder: (ctx, formArray, _) {
          return Column(
            children: [
              ...(formArray as FormArray).controls.mapIndexed((index, control) {
                if (control is FormGroup) {
                  return Row(
                    // for fix bug reactive_forms
                    key: UniqueKey(),
                    children: [
                      _buildSectionGroup(ref, control, templateRenderInput)
                          .padding(ref
                              .read(templateRenderInputProvider)
                              .defaultPaddingWidgets)
                          .expandIntoColumnOrRow(),
                      templateRenderInput.defaultGapRow,
                      IconButton(
                        icon: const Icon(Icons.delete_rounded),
                        onPressed: () {
                          sectionGroupFormArray.removeAt(index);
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }).toList(),
              templateRenderInput.defaultGapColumn,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMainText(
                    "${templateRenderInput.buttonAddFieldToSection} ${section.names?.getDescriptionLabelTranslated(context)}",
                    expandIntoColumnOnRow: false,
                  ),
                  templateRenderInput.defaultGapRow,
                  IconButton(
                    onPressed: () {
                      sectionGroupFormArray.add(FormGroup({}));
                    },
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ],
          );
        },
      );
    } else {
      // normal section group
      final sectionGroupForm =
          ExtAbstractControl.controlNested(section.id, mainForm) as FormGroup;
      return _buildSectionGroup(ref, sectionGroupForm, templateRenderInput);
    }
  }

  Widget _buildSectionGroup(WidgetRef ref, FormGroup sectionGroupForm,
      TemplateRenderInput templateRenderInput) {
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
            templateRenderInput.defaultGapColumn,
            if (expanded)
              ...section.children.map((e) {
                // readonly feature
                return Visibility(
                  visible: (section.readonly ?? false) == false,
                  replacement: IgnorePointer(
                    ignoring: true,
                    child: Opacity(
                      opacity: 0.5,
                      child: SectionStepWidget(
                          section: e, mainForm: sectionGroupForm),
                    ),
                  ),
                  child:
                      SectionStepWidget(section: e, mainForm: sectionGroupForm),
                );
              }).toList()
          ],
        ),
      ).createMargin(templateRenderInput.defaultMarginWidgets);
    });
  }
}
