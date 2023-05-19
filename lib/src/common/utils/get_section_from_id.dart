import '../models/template.dart';

Section? getSectionFromId(String? sectionFieldId,
    {List<Section> sections = const []}) {
  for (var section in sections) {
    if (section.id == sectionFieldId) {
      return section;
    } else {
      // recursivity 🔥
      return getSectionFromId(sectionFieldId, sections: section.children ?? []);
    }
  }
  return null;
}