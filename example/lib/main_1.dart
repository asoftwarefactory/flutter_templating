import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DynamicFormWidget(
        loadTemplate: () async {
          return {
            "steps": [
              {
                "title": "Step 1",
                "fields": [
                  {"label": "Nome", "type": "text"},
                  {"label": "Email", "type": "email"},
                  {"label": "Email", "type": "email"},
                  {"label": "Email", "type": "email"},
                  {"label": "Email", "type": "email"},
                ]
              },
              {
                "title": "Step 2",
                "fields": [
                  {"label": "Età", "type": "number"},
                  {"label": "Telefono", "type": "phone"},
                  {"label": "Età", "type": "number"},
                  {"label": "Telefono", "type": "phone"},
                  {"label": "Età", "type": "number"},
                ]
              }
            ]
          };
        },
      ),
    );
  }
}

class DynamicFormWidget extends StatefulWidget {
  //final String url;
  final Future<dynamic> Function() loadTemplate;

  const DynamicFormWidget({
    Key? key,
    required this.loadTemplate,
  }) : super(key: key);

  @override
  DynamicFormWidgetState createState() => DynamicFormWidgetState();
}

class DynamicFormWidgetState extends State<DynamicFormWidget> {
  late List<Step> _steps = [];
  int stepIndex = 0;
  @override
  void initState() {
    super.initState();
    _loadTemplate();
  }

  void _loadTemplate() async {
    final response =
        await widget.loadTemplate(); // await http.get(Uri.parse(widget.url));
    final json = (response); // jsonDecode(response);

    final stepsJson = json['steps'] as List<dynamic>;
    final steps = stepsJson.map((stepJson) {
      final fieldsJson = stepJson['fields'] as List<dynamic>;
      final fields = fieldsJson.map((fieldJson) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: fieldJson['label'] as String,
          ),
          keyboardType: _getKeyboardType(fieldJson['type'] as String),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${fieldJson['label']} is required';
            }
            return null;
          },
        );
      }).toList();

      return Step(
        isActive: true,
        title: Text(stepJson['title'] as String),
        content: Column(
          children: fields,
        ),
      );
    }).toList();

    setState(() {
      _steps = steps;
    });
  }

  TextInputType _getKeyboardType(String type) {
    switch (type) {
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'email':
        return TextInputType.emailAddress;
      case 'phone':
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_steps.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stepper(
      type: StepperType.vertical,
      onStepTapped: (step) {
        setState(() {
          stepIndex = step;
        });
      },
      onStepContinue: () {
        if (stepIndex < (_steps.length - 1)) {
          setState(() {
            stepIndex += 1;
          });
        }
      },
      onStepCancel: () {
        if (stepIndex > 0) {
          setState(() {
            stepIndex -= 1;
          });
        }
      },
      currentStep: stepIndex,
      steps: _steps,
    );
  }
}
