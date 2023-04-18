import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import '../utils/app_sizes.dart';
import 'template_stepper_widget.dart';

class CoreTemplateRenderWidget extends StatelessWidget {
  const CoreTemplateRenderWidget({super.key, required this.template});
  final Template template;
  @override
  Widget build(BuildContext context) {
    if (FlutterTemplating.of(context) == null) {
      throw Exception("FlutterTemplating not initialized");
    }
    return TemplateContainerWidget(template: template);
  }
}

class TemplateContainerWidget extends StatelessWidget {
  final Template template;
  const TemplateContainerWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Column(children: [
            if (template.names != null)
              AutoSizeText(
                  template.names!.getDescriptionLabelTranslated(context) ?? ''),
            if (template.descriptions != null)
              AutoSizeText(template.descriptions!
                      .getDescriptionLabelTranslated(context) ??
                  ''),
          ]),
          TemplateStepperWidget(
            formGroupTemplate:
                FormGroupExt.createFormGroupFromTemplateJSON(template),
            template: template,
          ).expandIntoColumnOrRow(),
        ],
      ),
    );
  }

  Widget buildTitleTemplate(String title, {String? description}) {
    return Row(children: [
      AutoSizeText(title).expandIntoColumnOrRow(),
    ]).margin(const EdgeInsets.symmetric(vertical: Sizes.p12));
  }
}
