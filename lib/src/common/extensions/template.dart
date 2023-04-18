import '../models/template.dart';

extension TemplateExt on Template {
  /* List<Section> getSectionsFromTemplateStep(String templateStepId) {
    final currentStep = (steps ?? [])
        .firstWhereOrNull((element) => element.id == templateStepId);

    if (currentStep != null) {
      final a = (currentStep.groupIds ?? []);
      return (sections ?? [])
          .where((element) => a.any((groupId) => groupId == element.id))
          .toList();
    } else {
      return [];
    }
  }

  List<Section> getSectionsFromTemplateSteps(List<String> templateStepIds) {
    final List<Section> sections = [];
    for (var stepId in templateStepIds) {
      sections.addAll(getSectionsFromTemplateStep(stepId));
    }
    return sections;
  } */
}
