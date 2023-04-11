import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';

Future<void> main() async {
  runApp(const MyApp());
}

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FormStepsWidget(
        steps: StepsModel(
          name: "Template Bologna BB",
          steps: [
            StepModel(
              name: 'PORTICI PER BOLOGNA...',
              forms: [
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
              ],
            ),
            StepModel(
              name: 'PORTICI PER BOLOGNA...',
              forms: [
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "email"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "password"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
              ],
            ),
            StepModel(
              name: 'PORTICI PER BOLOGNA...',
              forms: [
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
              ],
            ),
            StepModel(
              name: 'PORTICI PER BOLOGNA...',
              forms: [
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "email"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "password"),
                  ],
                ),
              ],
            ),
            StepModel(
              name: 'PORTICI PER BOLOGNA...',
              forms: [
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "checkbox"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "checkbox"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "checkbox"),
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "password"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "text"),
                  ],
                ),
                FormModel(
                  name: "nome del form",
                  fields: [
                    FieldModel(
                        name: "ciao inserisci una stringa", type: "checkbox"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ).list().padding(const EdgeInsets.all(20)),
    );
  }
}
