import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/template_step.dart';
import 'package:flutter_templating/src/common/widgets/section_step_widget.dart';

import '../utils/app_sizes.dart';

class TemplateStepperWidget extends StatelessWidget {
  final Template template;
  final FormGroup formGroupTemplate;

  const TemplateStepperWidget({
    Key? key,
    required this.template,
    required this.formGroupTemplate,
  }) : super(key: key);

  // definitions Sections with steps.
  @override
  Widget build(BuildContext context) {
    final templateStepperBuilderProvider =
        StateNotifierProvider<_IndexedNotifier, int>(
            (ref) => _IndexedNotifier());
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final index = ref.watch(templateStepperBuilderProvider);
        return Stepper(
          onStepCancel: () {
            if (index > 0) {
              return ref
                  .read(templateStepperBuilderProvider.notifier)
                  .decrement();
            }
          },
          onStepContinue: () {
            if (index < ((template.steps?.length ?? 0) - 1)) {
              return ref
                  .read(templateStepperBuilderProvider.notifier)
                  .increment();
            }
          },
          onStepTapped: (value) {
            return ref.read(templateStepperBuilderProvider.notifier).set(value);
          },
          currentStep: index,
          steps: template.steps?.map((step) {
                final sectionsFromStep =
                    step.getSectionsFromStep(template.sections ?? []);
                final sections = <Section>[];
                return Step(
                  content: Column(
                    children: sectionsFromStep.map((section) {
                      sections.add(section);
                      return SectionStepWidget(
                        formGroupTemplate: formGroupTemplate,
                        section: section,
                      );
                    }).toList(),
                  ),
                  title: Column(
                    children: [
                      AutoSizeText(sections.lastOrNull?.names
                              ?.getDescriptionLabelTranslated(context) ??
                          ""),
                      gapH12,
                      AutoSizeText(sections.lastOrNull?.descriptions
                              ?.getDescriptionLabelTranslated(context) ??
                          ""),
                    ],
                  ),
                );
              }).toList() ??
              <Step>[],
        );
      },
    );
  }
}

class _IndexedNotifier extends StateNotifier<int> {
  _IndexedNotifier({int index = 0}) : super(index);

  void increment() {
    state += 1;
  }

  void decrement() {
    state -= 1;
  }

  void set(int index) {
    state = index;
  }
}
