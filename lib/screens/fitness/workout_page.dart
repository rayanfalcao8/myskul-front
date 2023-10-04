import 'package:flutter/material.dart';
import 'package:myskul/utilities/helpers.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({super.key, required this.level, required this.bodyPart});

  final int level;
  final String bodyPart;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState(level, bodyPart);
}

class _WorkoutPageState extends State<WorkoutPage> {
  int _level;
  String _bodyPart;

  _WorkoutPageState(this._level, this._bodyPart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Exercices", context: context),
    );
  }
}
