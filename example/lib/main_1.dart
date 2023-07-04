import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/common/constants/json_template_portico.dart';
import 'src/common/errors/register_error_handlers.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  registerErrorHandlers();
  setPathUrlStrategy();
  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      supportedLocales: const [
        Locale("en", "US"),
        Locale("it"),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "template app",
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 10,
          color: Colors.white,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TemplateScreen(),
    );
  }
}

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({super.key});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text("Prova Template"),
      ), */
      body: SafeArea(
        child: CoreTemplateRenderWidget(
          templateRenderInput: TemplateRenderInput(
            enableStepperMargin: false,
            enableDebugLog: true,
            buttonAddFieldToSection: "Aggiungi",
            defaultPaddingWidgets: const EdgeInsets.symmetric(vertical: 5),
            defaultMarginWidgets: const EdgeInsets.symmetric(vertical: 5),
            template: templateFromJson(jsonTemplatePortico),
            onTemplateFormSend: (e) async {},
            bearerAccessToken:
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkU3MzFFOTU2M0VBODEwMTQ0NTg1Q0QzRDgwOTBENzA3Q0M5OTVFODZSUzI1NiIsIng1dCI6IjV6SHBWajZvRUJSRmhjMDlnSkRYQjh5WlhvWSIsInR5cCI6ImF0K2p3dCJ9.eyJpc3MiOiJodHRwczovL2xvZ2luLWRldi5hc2Z3ZWIuaXQiLCJuYmYiOjE2ODQzNTYyNzQsImlhdCI6MTY4NDM1NjI3NCwiZXhwIjoxNjg0MzU2NTc0LCJhdWQiOiJhcGkiLCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiYXBpIiwib2ZmbGluZV9hY2Nlc3MiXSwiYW1yIjpbInB3ZCJdLCJjbGllbnRfaWQiOiJ3ZWJjbGllbnRzIiwic3ViIjoiNzI5OTgxYTctOTNmYi00ZjdlLTk4NzUtZjU5YjhkZGM0MWRlIiwiYXV0aF90aW1lIjoxNjg0MzU2MjY4LCJpZHAiOiJsb2NhbCIsImVtYWlsIjoibWFyaW84NTc5ODc5NDhAZ21haWwuY29tIiwicHJlZmVycmVkX3VzZXJuYW1lIjoibWFyaW84NTc5ODc5NDhAZ21haWwuY29tIiwiUHJvZmlsZUlkIjoiNDI5IiwiTG9naW5Qcm92aWRlciI6IiIsIlVzZXJJZCI6IjcyOTk4MWE3LTkzZmItNGY3ZS05ODc1LWY1OWI4ZGRjNDFkZSIsInNpZCI6IjE4ODJCRDZDMUM3RTM3QUYzRkU0NDY1NDYwN0E1OUFCIn0.Hx0f47Cq8dLRq1dt6DvluqqkSKze6MP2A4UKGXuItpEeSYoQ0XG7W_oleWuyo7tK1vfalwBgA_QC6DQANKyYZ77PH9RxlEF_EW-lJ4SkvxeTL4BX1irOZh0628M5RwHddhlKLoruO5FJPC6e9q8oDsQ6SumlsVVdCiN1I_snlvjVIEPeeAaE3XgRel5T4AvRu7L9ZEAYNUKTj-mX2_Vlfrjiwh63dZRf-PNuKPXFXsNIzcVkqKX7MlHbkj8cTtPR49B7nIkAp14sQA3EXHRs7xe8cm7_NQlyV3uXnnO2V5HJJU5FteXzNRvg3qQnqumjnwzTgEh4PMVI5QKep0bm6w",
            authorityId: "6",
            apiBaseUrl: "https://api-dev.smartpa.cloud/portico/v1/",
            /* urlOutput: (baseUrl, partOfOutputUrl) {
              return (baseUrl + partOfOutputUrl)
                  .replaceAll("/v1//v1/", "/v1/")
                  .replaceAll("/v1/v1/", "/v1/");
            }, */
          ),
        ),
      ),
    );
  }
}
