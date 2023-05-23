import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../common/models/autocomplete_model.dart';
import '../../common/models/dataprovider_model.dart';
import '../../common/models/template.dart';
import '../../common/models/template_render_input.dart';
import '../http_client/http_client.dart';

final templateRenderInputProvider =
    StateProvider.autoDispose<TemplateRenderInput>((ref) {
  return TemplateRenderInput(
    authorityId: '',
    apiBaseUrl: '',
    bearerAccessToken: '',
    template: Template(),
  );
});

final mainFormProvider = Provider((ref) {
  final formGroup = FormGroup({});
  ref.onDispose(() {
    formGroup.dispose();
  });
  return formGroup;
});

final autocompletesProvider =
    FutureProvider.autoDispose<List<AutocompleteModel>>((ref) async {
  final client = ref.read(httpClient);
  return await client.get("autocompletes").then((e) {
    return autocompletesModelFromList(e.data);
  });
});

final dataprovidersProvider =
    FutureProvider.autoDispose<List<DataproviderModel>>((ref) async {
  final client = ref.read(httpClient);
  return await client.get("dataproviders").then((e) {
    return dataprovidersModelFromList(e.data);
  });
});