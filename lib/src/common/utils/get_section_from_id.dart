import '../models/template.dart';

Section? getSectionFromId(String? sectionFieldId,
    {List<Section> sections = const []}) {
  for (final section in sections) {
    if (section.id == sectionFieldId) {
      return section;
    } else {
      // recursivity 🔥
      if (section.type == SectionType.GROUP) {
        final sec =
            getSectionFromId(sectionFieldId, sections: section.children ?? []);
        if (sec != null) {
          return sec;
        } else {
          continue;
        }
      } else {
        continue;
      }
    }
  }
  return null;
}
