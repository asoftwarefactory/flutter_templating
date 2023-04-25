import '../models/template.dart';

extension ExtTemplateStep on TemplateStep {
  List<Section> getSectionsFromStep(List<Section> allSections) {
    return allSections
        .where((element) =>
            (groupIds ?? []).any((groupId) => groupId == element.id))
        .toList();
  }

  List<Section> getSectionsNotHiddenFromStep(List<Section> allSections) {
    return getSectionsFromStep(allSections)
        .where((element) => element.hidden != true)
        .toList();
  }
}
