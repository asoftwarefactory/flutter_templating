import 'package:reactive_forms/reactive_forms.dart';
import '../models/template.dart';

extension FormGroupExt on FormGroup {
  static FormGroup createFormGroupFromTemplateJSON(Template template) {
    return FormGroup({
      Template.pNameid: FormControl<String>(value: template.id),
      Template.pNamegroupId: FormControl(value: template.groupId),
      Template.pNamecreatedAt: FormControl(value: template.createdAt),
      Template.pNameisValid: FormControl(value: template.isValid),
      Template.pNamescopes: FormArray(template.scopes?.map((e) {
            return FormControl(value: e);
          }).toList() ??
          []),
      Template.pNamenames: FormArray(template.names?.map((e) {
            return FormGroup({
              Description.pNameculture: FormControl(value: e.culture),
              Description.pNamelabel: FormControl(value: e.label),
            });
          }).toList() ??
          []),
      Template.pNamedescriptions: FormArray(template.descriptions?.map((e) {
            return FormGroup({
              Description.pNameculture: FormControl(value: e.culture),
              Description.pNamelabel: FormControl(value: e.label),
            });
          }).toList() ??
          []),
      Template.pNamesections: FormArray(template.sections?.map((section) {
            return createFormGroupFromSection(section);
          }).toList() ??
          []),
      Template.pNameenabledIfRules: FormArray(template.enabledIfRules?.map((e) {
            return FormGroup({
              EnabledIfRule.pNameid: FormControl(value: e.id),
              EnabledIfRule.pNamename: FormControl(value: e.name),
              EnabledIfRule.pNameconditions:
                  FormArray(e.conditions?.map((condition) {
                        return FormGroup({
                          Condition.pNamefieldId:
                              FormControl(value: condition.fieldId),
                          Condition.pNameconstraint:
                              FormControl(value: condition.constraint),
                          Condition.pNamevalues:
                              FormArray(condition.values?.map((value) {
                                    return FormControl(value: value);
                                  }).toList() ??
                                  []),
                        });
                      }).toList() ??
                      []),
              EnabledIfRule.pNamegroupIds: FormArray(e.groupIds?.map((group) {
                    return FormControl(value: group);
                  }).toList() ??
                  []),
              EnabledIfRule.pNamefieldIds: FormArray(e.fieldIds?.map((field) {
                    return FormControl(value: field);
                  }).toList() ??
                  []),
            });
          }).toList() ??
          []),
      Template.pNamedataProviders: FormArray(template.dataProviders?.map((e) {
            return FormGroup({
              DataProvider.pNameid: FormControl(value: e.id),
              DataProvider.pNamename: FormControl(value: e.name),
              DataProvider.pNametype: FormControl(value: e.type),
              DataProvider.pNamedataProviderName:
                  FormControl(value: e.dataProviderName),
              DataProvider.pNameinputs: FormArray(e.inputs?.map((input) {
                    return FormGroup({
                      Put.pNamefieldId: FormControl(value: input.fieldId),
                      Put.pNamedataProviderFieldName:
                          FormControl(value: input.dataProviderFieldName),
                    });
                  }).toList() ??
                  []),
              DataProvider.pNameoutputs: FormArray(e.outputs?.map((output) {
                    return FormGroup({
                      Put.pNamefieldId: FormControl(value: output.fieldId),
                      Put.pNamedataProviderFieldName:
                          FormControl(value: output.dataProviderFieldName),
                    });
                  }).toList() ??
                  []),
              DataProvider.pNamesectionChildId:
                  FormControl(value: e.sectionChildId),
            });
          }).toList() ??
          []),
      Template.pNamesteps: FormArray(
        template.steps?.map((step) {
              return FormGroup({
                TemplateStep.pNameid: FormControl(value: step.id),
                TemplateStep.pNamegroupIds: FormArray(
                  step.groupIds?.map((groupId) {
                        return FormControl<String>(value: groupId);
                      }).toList() ??
                      [],
                ),
              });
            }).toList() ??
            [],
      ),
      Template.pNamename: FormControl(value: template.name),
      Template.pNamemigrationType: FormControl(value: template.migrationType),
    });
  }

  static FormGroup createFormGroupFromSection(Section section) {
    return FormGroup({
      Section.pNameid: FormControl<String>(value: section.id),
      Section.pNamename: FormControl(value: section.name),
      Section.pNamesearchable: FormControl(value: section.searchable),
      Section.pNamenames: FormArray(section.names?.map((e) {
            return FormGroup({
              Description.pNameculture: FormControl(value: e.culture),
              Description.pNamelabel: FormControl(value: e.label),
            });
          }).toList() ??
          []),
      Section.pNamedescriptions: FormArray(section.descriptions?.map((e) {
            return FormGroup({
              Description.pNameculture: FormControl(value: e.culture),
              Description.pNamelabel: FormControl(value: e.label),
            });
          }).toList() ??
          []),
      Section.pNamehidden: FormControl(value: section.hidden),
      Section.pNamereadonly: FormControl(value: section.readonly),
      Section.pNamefieldType: FormControl(value: section.fieldType?.name),
      Section.pNameisArray: FormControl(value: section.isArray),
      Section.pNamedefaultValue: FormControl(value: section.defaultValue),
      Section.pNamevalidators: FormArray(section.validators?.map((validator) {
            return FormGroup({
              SectionValidator.pNametype: FormControl(value: validator.type),
              SectionValidator.pNamerequired:
                  FormControl(value: validator.required),
              SectionValidator.pNamenumOfDecimals:
                  FormControl(value: validator.numOfDecimals),
              SectionValidator.pNamenumber:
                  FormControl(value: validator.number),
              SectionValidator.pNamedate: FormControl(value: validator.date),
              SectionValidator.pNameinclude:
                  FormControl(value: validator.include),
              SectionValidator.pNamelength:
                  FormControl(value: validator.length),
              SectionValidator.pNamedateValue:
                  FormControl(value: validator.dateValue),
              SectionValidator.pNamedateValueType:
                  FormControl(value: validator.dateValueType),
              SectionValidator.pNameregex: FormControl(value: validator.regex),
              SectionValidator.pNameextensions:
                  FormArray(validator.extensions?.map((ext) {
                        return FormControl(value: ext);
                      }).toList() ??
                      []),
            });
          }).toList() ??
          []),
      Section.pNameitems: FormArray(section.items?.map((e) {
            return FormGroup({
              Item.pNamekey: FormControl(value: e.key),
              Item.pNamelabel: FormControl(value: e.label),
            });
          }).toList() ??
          []),
      Section.pNamemultiple: FormControl(value: section.multiple),
      Section.pNamechildren: FormArray(section.children?.map((section) {
            // recursivity
            return createFormGroupFromSection(section);
          }).toList() ??
          []),
      Section.pNametype: FormControl(value: section.type?.name),
      Section.pNameworkflowFieldId: FormControl(value: section.workflowFieldId),
      Section.pNameautocomplete: FormGroup({
        TemplateFieldAutocomplete.pNamename:
            FormControl(value: section.autocomplete?.name),
        TemplateFieldAutocomplete.pNameinputs:
            FormArray(section.autocomplete?.inputs?.map((input) {
                  return FormGroup({
                    TemplateAutocompleteFieldMapping.pNamefieldId:
                        FormControl(value: input.fieldId),
                    TemplateAutocompleteFieldMapping.pNameautocompleteFieldName:
                        FormControl(value: input.autocompleteFieldName),
                  });
                }).toList() ??
                []),
      }),
    });
  }
}
