import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import 'template_stepper_widget.dart';
import 'title_description_widget.dart';

class CoreTemplateRenderWidget extends StatelessWidget {
  const CoreTemplateRenderWidget({
    Key? key,
    required this.template,
    this.templateRenderInput = const TemplateRenderInput(),
  }) : super(key: key);
  final Template template;
  final TemplateRenderInput templateRenderInput;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        templateRenderInputProvider.overrideWith((ref) => templateRenderInput)
      ],
      child: TemplateContainerWidget(template: template),
    );
  }
}

class TemplateContainerWidget extends ConsumerWidget {
  final Template template;
  const TemplateContainerWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    return ReactiveForm(
      formGroup: ref.read(mainFormGroupProvider),
      child: Consumer(builder: (context, ref, _) {
        return Card(
          child: Column(
            children: [
              TitleDescriptionWidget(
                title: template.names?.getDescriptionLabelTranslated(context) ??
                    '',
                description: template.descriptions
                    ?.getDescriptionLabelTranslated(context),
              ),
              TemplateStepperWidget(
                template: template,
              ).expandIntoColumnOrRow(),
            ],
          ),
        ).createMargin(
            ref.read(templateRenderInputProvider).defaultMarginWidgets);
      }),
    );
  }
}

final templateRenderInputProvider = StateProvider((ref) {
  return const TemplateRenderInput();
});

final mainFormGroupProvider = Provider((ref) {
  final formGroup = FormGroup({});
  ref.onDispose(() {
    formGroup.dispose();
  });
  return formGroup;
});
