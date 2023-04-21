import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/common/errors/register_error_handlers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerErrorHandlers();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("it", "IT"),
      ],
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: const Locale("it"),
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
  Template? _template;

  bool showingTemplateCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prova Template"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showingTemplateCode = !showingTemplateCode;
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) => SizedBox(
          child: Column(
            // direction: Axis.vertical,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: showingTemplateCode ? 500 : 0,
                child: TemplateLoader(
                  showTextEditor: showingTemplateCode,
                  initTemplateLoader: (t) {
                    setState(() {
                      _template = t;
                      showingTemplateCode = false;
                    });
                  },
                  changeTemplate: (t) {
                    setState(() {
                      _template = t;
                    });
                  },
                ),
              ),
              if (_template != null)
                Expanded(child: CoreTemplateRenderWidget(template: _template!))
            ],
          ),
        ),
      ),
    );
  }
}

class TemplateLoader extends StatefulWidget {
  const TemplateLoader({
    super.key,
    this.changeTemplate,
    this.initTemplateLoader,
    this.showTextEditor = true,
  });
  final void Function(Template)? changeTemplate;
  final void Function(Template)? initTemplateLoader;
  final bool showTextEditor;
  @override
  State<TemplateLoader> createState() => _TemplateLoaderState();
}

class _TemplateLoaderState extends State<TemplateLoader> {
  final _controller = TextEditingController();
  final _templateStorageKey = "template_storage_key";
  Template? _template;
  void _saveEditing(String value) async {
    try {
      value = value.trim();
      _template = templateFromJson(value);
      widget.changeTemplate?.call(_template!);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_templateStorageKey, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((e) {
      String? v = e.getString(_templateStorageKey);
      if (v != null) {
        v = v.trim();
        setState(() {
          _template = templateFromJson(v!);
          _controller.text = v;
          widget.initTemplateLoader?.call(_template!);
          widget.changeTemplate?.call(_template!);
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showTextEditor) {
      return TextField(
        onEditingComplete: () {},
        onChanged: (v) {
          _saveEditing(_controller.text);
        },
        controller: _controller,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
        decoration: const InputDecoration(
          hintText: 'Inserisci il template JSON...',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
        ),
        textInputAction: TextInputAction.newline,
      );
    }
    return const SizedBox();
  }
}



/* 
class CustomCodeInputWidget extends StatefulWidget {
  @override
  _CustomCodeInputWidgetState createState() => _CustomCodeInputWidgetState();
}

class _CustomCodeInputWidgetState extends State<CustomCodeInputWidget> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], // colore di sfondo scuro
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: CodeEditor(
        controller: _controller,
        focusNode: _focusNode,
        options: CodeEditorOptions(
          fontFamily: 'RobotoMono', // font-family personalizzato
          fontSize: 16.0, // dimensione del font
          showLineNumbers: true, // visualizza il numero di riga
          readOnly: false, // consente l'input dell'utente
          language: 'dart', // impostare la lingua del codice
        ),
        styleOptions: CodeEditorStyleOptions(
          backgroundColor: Colors.grey[900], // colore di sfondo scuro
          fontFamily: 'RobotoMono', // font-family personalizzato
          fontSize: 16.0, // dimensione del font
          lineHeight: 1.4, // altezza della riga
          textColor: Colors.white, // colore del testo
          cursorColor: Colors.white, // colore del cursore
          selectionColor: Colors.blue[800], // colore della selezione del testo
        ),
      ),
    );
  }
}
 */
/* class DropFile extends StatefulWidget {
  const DropFile({Key? key}) : super(key: key);

  @override
  DropFileState createState() => DropFileState();
}

class DropFileState extends State<DropFile> {
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Column(
          children: [
            Expanded(
              child: Container(
                color: highlighted1 ? Colors.red : Colors.transparent,
                child: Stack(
                  children: [
                    buildZone1(context),
                    Center(child: Text(message1)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  buildZone2(context),
                  Center(child: Text(message2)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await controller1.pickFiles(mime: [
                  'image/jpeg',
                  'image/png',
                  'application/json',
                ]));
              },
              child: const Text('Pick file'),
            ),
          ],
        ),
      );

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onHover: () {
            setState(() => highlighted1 = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => highlighted1 = false);
            print('Zone 1 left');
          },
          onDrop: (ev) async {
            print('Zone 1 drop: ${ev.name}');
            setState(() {
              message1 = '${ev.name} dropped';
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(ev);
            print(bytes.sublist(0, 20));
          },
          onDropMultiple: (ev) async {
            print('Zone 1 drop multiple: $ev');
          },
        ),
      );

  Widget buildZone2(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.move,
          onCreated: (ctrl) => controller2 = ctrl,
          onLoaded: () => print('Zone 2 loaded'),
          onError: (ev) => print('Zone 2 error: $ev'),
          onHover: () => print('Zone 2 hovered'),
          onLeave: () => print('Zone 2 left'),
          onDrop: (ev) {
            print('Zone 2 drop: ${ev.name}');
            setState(() {
              message2 = '${ev.name} dropped';
            });
            final stream = controller2.getFileStream(ev);
            print(stream.take(20));
          },
          onDropMultiple: (ev) async {
            print('Zone 2 drop multiple: $ev');
          },
        ),
      );
} */
