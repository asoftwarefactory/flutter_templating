import '../models/template.dart';
import 'get_section_from_id.dart';

bool fieldIsSearchable(Template template, String fieldId) {
  return getSectionFromId(fieldId, sections: template.sections)?.searchable ??
      false;
}
