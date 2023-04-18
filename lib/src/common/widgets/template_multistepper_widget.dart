/* import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'template_stepper_widget.dart';

class TemplateMultiStepperWidget extends StatelessWidget {
  final Template template;
  final FormGroup formGroupTemplate;
  const TemplateMultiStepperWidget({
    super.key,
    required this.template,
    required this.formGroupTemplate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: template.steps?.length ?? 0,
      itemBuilder: (ctx, index) {
        if (template.steps?.isNotEmpty ?? false) {
          final step = template.steps?.elementAt(index) ?? TemplateStep();
          return TemplateStepperWidget(
            formGroupTemplate: formGroupTemplate,
            template: template,
            templateStepId: step.id,
          ).margin(const EdgeInsets.all(10));
        } else {
          return const SizedBox();
        }
      },
    );
  }
} */
