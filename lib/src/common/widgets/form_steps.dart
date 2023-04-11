import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';

import '../models/step.dart';
import 'form_step.dart';

class FormStepsWidget extends StatelessWidget {
  final StepsModel steps;
  const FormStepsWidget({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(steps.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...steps.steps.map((step) => FormStepWidget(step: step)).toList(),
      ],
    )
        .padding(const EdgeInsets.all(10))
        .border(borderSize: 1.5, radius: 25)
        .margin(const EdgeInsets.all(10));
  }
}
