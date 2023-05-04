import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

void main() {
  runZonedGuarded(() => runApp(const App()), (error, stack) {});
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "title",
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ReactiveFormExample());
  }
}

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  State<ReactiveFormExample> createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  final form = FormGroup({
    'dropdown': FormControl<Unique<bool>>(),
  });

  final data = List<Unique<bool>>.from([
    Unique(value: true),
    Unique(value: false),
    Unique(value: true),
    Unique(value: false)
  ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    form.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      return ReactiveForm(
        formGroup: form,
        child: ReactiveDropdownField<Unique<bool>>(
          formControlName: "dropdown",
          items: data
              .map(
                (e) => DropdownMenuItem<Unique<bool>>(
                  value: e,
                  child: SizedBox(
                    width: 500,
                    child: ListTile(
                      title: Text(
                        e.toString(),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}

class Unique<T> {
  late final String _id;
  final T value;

  Unique({
    required this.value,
  }) {
    _id = const Uuid().v1();
  }

  Unique<T> copyWith({
    T? data,
  }) {
    return Unique<T>(
      value: data ?? this.value,
    );
  }

  @override
  String toString() => 'Wrapper(data: $value, id: $_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Unique<T> && other.value == value && other._id == _id;
  }

  @override
  int get hashCode => value.hashCode + _id.hashCode;
}
