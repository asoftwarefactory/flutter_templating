import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../common/models/autocomplete_model.dart';
import '../../common/models/dataprovider_model.dart';
import '../../common/models/template.dart';
import '../../common/models/template_render_input.dart';
import '../../common/utils/initialize_main_form_with_template.dart';
import '../http_client/http_client.dart';

final templateRenderInputProvider =
    StateProvider.autoDispose<TemplateRenderInput>((ref) {
  return TemplateRenderInput(
    authorityId: '',
    apiBaseUrl: '',
    bearerAccessToken: '',
    template: Template(id: "", sections: []),
  );
});

final mainFormProvider = Provider((ref) {
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
});

final autocompletesProvider =
    FutureProvider<List<AutocompleteModel>>((ref) async {
  final client = ref.read(httpClient);
  return await client.get("autocompletes").then((e) {
    return autocompletesModelFromList(e.data);
  });
});

final dataprovidersProvider =
    FutureProvider<List<DataproviderModel>>((ref) async {
  final client = ref.read(httpClient);
  return await client.get("dataproviders").then((e) {
    return dataprovidersModelFromList(e.data);
  });
});
