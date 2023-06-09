import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import 'custom_main_text.dart';
import 'section_step_widget.dart';
import 'title_description_widget.dart';

class SectionGroupWidget extends ConsumerWidget {
  final Section section;
  final FormGroup form; // main form
  const SectionGroupWidget({
    required this.section,
    required this.form,
    super.key,
  });

  bool get _sectionIsMultiple {
    return section.type == SectionType.GROUP && section.multiple == true;
  }

  @override
  Widget build(context, ref) {
    // section group is multiple

    if (_sectionIsMultiple) {
      final sectionGroupFormArray =
          form.getOrSetAbstractControlAndSetValidators(
        section.id!,
        () => FormArray([]),
        isArray: section.isArray ?? false,
        validators: section.validators,
      ) as FormArray;
      return ReactiveValueListenableBuilder(
        formControl: sectionGroupFormArray,
        builder: (ctx, control, _) {
          return Column(
            children: [
              ...(control as FormArray).controls.asMap().entries.map((entry) {
                final index = entry.key;
                final control = entry.value;
                return Row(
                  // unique key because otherwise some bugs could occur
                  // key: UniqueKey(),
                  children: [
                    if (control is FormGroup)
                      _buildSectionGroup(ref, control)
                          .padding(ref
                              .read(templateRenderInputProvider)
                              .defaultPaddingWidgets)
                          .expandIntoColumnOrRow(),
                    ref.read(templateRenderInputProvider).defaultGapRow,
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        sectionGroupFormArray.removeAt(index);
                      },
                    ),
                  ],
                );
              }).toList(),
              ref.read(templateRenderInputProvider).defaultGapColumn,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMainText(
                    "${ref.read(templateRenderInputProvider).buttonAddFieldToSection} ${section.names?.getDescriptionLabelTranslated(context)}",
                    expandIntoColumnOnRow: false,
                  ),
                  ref.read(templateRenderInputProvider).defaultGapRow,
                  IconButton(
                    onPressed: () {
                      sectionGroupFormArray.add(FormGroup({}));
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          );
        },
      );
    } else {
      // normal section group

      final sectionGroupForm = form.getOrSetAbstractControlAndSetValidators(
        section.id!,
        () => FormGroup({}),
        isArray: section.isArray ?? false,
        validators: section.validators,
      ) as FormGroup;
      return _buildSectionGroup(ref, sectionGroupForm);
    }
  }

  Widget _buildSectionGroup(WidgetRef ref, FormGroup sectionGroupForm) {
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
                          child: SectionStepWidget(
                              section: e, mainForm: sectionGroupForm),
                        ),
                      ),
                      child: SectionStepWidget(
                          section: e, mainForm: sectionGroupForm),
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
