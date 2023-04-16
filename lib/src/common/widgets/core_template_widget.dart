import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../extensions/formgroup.dart';
import '../models/template.dart';
import 'template_multistepper_widget.dart';

class CoreTemplateWidget extends StatelessWidget {
  const CoreTemplateWidget({super.key, required this.template});
  final Template template;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (template.name != null)
            Row(children: [
              AutoSizeText(template.name!).expandIntoColumnOrRow()
            ]).margin(const EdgeInsets.symmetric(vertical: 10)),
          TemplateMultiStepperWidget(
            formGroupTemplate: FormGroupExt.createFormGroupFromTemplateJSON(template),
            template: template,
          ).expandIntoColumnOrRow(),
        ],
      ),
    );
  }
}
