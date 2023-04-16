import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/template.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart' as ft;
import 'section_step_title_widget.dart';
import 'section_step_widget.dart';

class TemplateStepperWidget extends StatelessWidget {
  final ft.Template template;
  final FormGroup formGroupTemplate;
  final String templateStepId;
  const TemplateStepperWidget({
    super.key,
    required this.template,
    required this.formGroupTemplate,
    required this.templateStepId,
  });

  @override
  Widget build(BuildContext context) {
    final sections = template.getSectionsFromTemplateStep(templateStepId);
    final templateStepperBuilderProvider =
        StateNotifierProvider<IndexedNotifier, int>((ref) => IndexedNotifier());
    return Consumer(
      builder: (ctx, ref, _) {
        final index = ref.watch(templateStepperBuilderProvider);
        return Card(
          child: Stepper(
            onStepCancel: () {
              if (index > 0) {
                return ref
                    .read(templateStepperBuilderProvider.notifier)
                    .decrement();
              }
            },
            onStepContinue: () {
              if (index < (sections.length - 1)) {
                return ref
                    .read(templateStepperBuilderProvider.notifier)
                    .increment();
              }
            },
            onStepTapped: (value) {
              return ref
                  .read(templateStepperBuilderProvider.notifier)
                  .set(value);
            },
            currentStep: index,
            steps: sections.map((e) {
              return Step(
                isActive: true,
                content: SectionStepWidget(
                  formGroupTemplate: formGroupTemplate,
                  section: e,
                ),
                title: SectionStepTitleWidget(section: e),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

// riverpod


class IndexedNotifier extends StateNotifier<int> {
  IndexedNotifier({int index = 0}) : super(index);

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

Locale getAppLocale(BuildContext context) {
  return Localizations.localeOf(context);
}
