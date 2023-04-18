import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'src/constants/json_template_mock.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterTemplating(
      child: const MyApp())); // initialize FlutterTemplating package - required
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 4,
          color: Colors.white,
        ),
      ),
      title: "template app",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CoreTemplateRenderWidget(template: templateFromJson(jsonTemplate)),
    );
  }
}
