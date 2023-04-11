import 'form.dart';

class StepsModel {
  final String name;
  final List<StepModel> steps;

  StepsModel({required this.name, required this.steps});
}

class StepModel {
  final String name;
  final List<FormModel> forms;

  StepModel({required this.name, required this.forms});
}
