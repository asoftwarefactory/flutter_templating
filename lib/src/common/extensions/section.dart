import 'package:collection/collection.dart';
import '../models/autocomplete_model.dart';
import '../models/template.dart';

extension ExtSection on Section {
  Section getAndOrderChildrenByTypeField() {
    final apChildren = children ?? [];
    apChildren.sort((e1, e2) {
      if (e1.type == SectionType.GROUP && e2.type == SectionType.FIELD) {
        return 1;
      } else {
        return -1;
      }
    });
    return copyWith(children: apChildren);
  }

  Type castDartTypeFromFieldType() {
    switch (fieldType) {
      case FieldTypes.String:
        return String;
      case FieldTypes.Integer:
        return int;
      case FieldTypes.Decimal:
        return double;
      case FieldTypes.Currency:
        return double;
      case FieldTypes.Boolean:
        return bool;
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        return String;
      case FieldTypes.DateNoUtc:
        return String;
      case FieldTypes.DateTime:
        return String;
      case FieldTypes.Time:
        return String;
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        return String;
      default:
        return String;
    }
  }

  AutocompleteModel? filterAutocompleteBySectionField(List<AutocompleteModel> autocompletes) {
    return autocompletes.firstWhereOrNull(
      (a) {
        if (autocomplete?.name != null &&
            a.name != null &&
            autocomplete!.name!.isNotEmpty &&
            a.name!.isNotEmpty &&
            autocomplete!.name!.toLowerCase() == a.name!.toLowerCase() &&
            searchable == true) {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}
