import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/common/constants/json_template_mock.dart';
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
      appBar: AppBar(
        title: const Text("Prova Template"),
      ),
      body: CoreTemplateRenderWidget(
        template: templateFromJson(jsonTemplate),
        templateRenderInput: TemplateRenderInput(
          onTemplateFormSend: (e) async {
            debugPrint(e.toString());
          },
        ),
      ),
    );
  }
}
