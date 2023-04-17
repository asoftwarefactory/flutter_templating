import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import 'template_multistepper_widget.dart';

class CoreTemplateWidget extends StatelessWidget {
  const CoreTemplateWidget({super.key, required this.template});
  final Template template;
  @override
  Widget build(BuildContext context) {
    if (FlutterTemplating.of(context) == null) {
      throw Exception("FlutterTemplating not initialized");
    }
    return Card(
      child: Column(
        children: [
          if (template.name != null)
            Row(children: [
              AutoSizeText(template.name!).expandIntoColumnOrRow()
            ]).margin(const EdgeInsets.symmetric(vertical: 10)),
          TemplateMultiStepperWidget(
            formGroupTemplate:
                FormGroupExt.createFormGroupFromTemplateJSON(template),
            template: template,
          ).expandIntoColumnOrRow(),
        ],
      ),
    );
  }
}
