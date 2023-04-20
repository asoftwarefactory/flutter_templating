import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'src/constants/json_template_mock.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 10,
          color: Colors.white,
        ),
      ),
      supportedLocales: const [
        Locale("en", "US"),
        // Locale("it"),
      ],
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: const Locale("it"),
      title: "template app",
      debugShowCheckedModeBanner: false,
      home: const TemplateLoader(),
    );
  }
}

class TemplateLoader extends StatelessWidget {
  const TemplateLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplatePage(
        template: templateFromJson(jsonTemplate),
      ),
    );
  }
}

class TemplatePage extends StatelessWidget {
  final Template template;
  const TemplatePage({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CoreTemplateRenderWidget(template: template),
    );
  }
}
