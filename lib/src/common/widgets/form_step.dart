import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../models/step.dart';
import 'form.dart';

class FormStepWidget extends StatelessWidget {
  final StepModel step;

  const FormStepWidget({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    bool expanded = true;
    return StatefulBuilder(
      builder: (ctx, set) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                set(() {
                  expanded = !expanded;
                });
              },
              child: Row(
                children: [
                  Text(step.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded),
                    onPressed: () {
                      set(() {
                        expanded = !expanded;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (expanded) const SizedBox(height: 10),
            if (expanded)
              ...step.forms.map((form) => FormWidget(form: form)).toList(),
          ],
        );
      },
    )
        .padding(const EdgeInsets.all(10))
        .border(borderSize: 1.5, radius: 25)
        .margin(const EdgeInsets.all(10));
  }
}
