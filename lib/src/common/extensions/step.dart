import 'package:flutter/material.dart';
import '../models/template.dart';

extension ExtStep on Step {
  static Step build(StepBuilder Function() create) {
    final step = create();
    return Step(
      content: step.content,
      title: step.title,
    );
  }

  static List<Step> buildWithSections(
      List<Section> sections, Step Function(Section section) create) {
    final List<Step> steps = [];
    for (var section in sections) {
      steps.add(create(section));
    }
    return steps;
  }
}

class StepBuilder {
  final Widget title;
  final Widget content;
  StepBuilder({
    required this.title,
    required this.content,
  });
}
