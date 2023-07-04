import 'dart:developer';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/models/autocomplete_model.dart';
import '../../common/models/template.dart';
import '../../common/models/template_render_input.dart';
import '../../common/utils/initialize_main_form_with_template.dart';
import '../http_client/http_client.dart';
part 'providers.g.dart';

@Riverpod(keepAlive: true)
TemplateRenderInput templateRenderInput(TemplateRenderInputRef ref) {
  return TemplateRenderInput(
    authorityId: '',
    apiBaseUrl: '',
    bearerAccessToken: '',
    template: Template(id: "", sections: []),
  );
}

@Riverpod(keepAlive: true)
FormGroup mainForm(MainFormRef ref) {
  final templatingInput = ref.read(templateRenderInputProvider);
  final template = templatingInput.template;
  final formGroup = FormGroup({"template": FormGroup({})});
  initializeMainFormWithTtemplate(
      formGroup.control("template") as FormGroup, template);
  if (templatingInput.enableDebugLog) {
    log(formGroup.value.toString(), name: "Initial FORMGROUP value");
  }
  ref.onDispose(() {
    formGroup.dispose();
  });
  return formGroup.control("template") as FormGroup;
}

@Riverpod(keepAlive: true)
Future<List<AutocompleteModel>> autocompletes(AutocompletesRef ref) async {
  final client = ref.read(httpClient);
  return await client.get("autocompletes").then((e) {
    return autocompletesModelFromList(e.data);
  });
}

@Riverpod(keepAlive: true)
class ItemsState extends _$ItemsState {
  void set(String fieldId, Items items) {
    final apItemsData = state;
    apItemsData.addAll({fieldId: items});
    updateShouldNotify(state, apItemsData);
  }

  @override
  Map<String, Items> build() {
    return <String, Items>{};
  }
}


@Riverpod(keepAlive: true)
Items sectionItems(SectionItemsRef ref , String sectionId){
  return ref.watch(itemsStateProvider.select((value) => value[sectionId]??<Item>[]));
}
