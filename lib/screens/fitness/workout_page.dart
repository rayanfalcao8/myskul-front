import 'package:flutter/material.dart';
import 'package:myskul/models/workout.dart';
import 'package:myskul/screens/fitness/fitness_data.dart';
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
    List<Workout> workouts = getAbsWorkouts(level: _level);

    return Scaffold(
      appBar: getAppBar(title: "Exercices", context: context),
      body: Container(
        decoration: getBckDecoration(),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red),
            ),
            for (Workout w in workouts)
              _buildContainer(w.title, w.seconds, w.reps, w.picture)
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
      String? title, int? seconds, int? reps, String? picture) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          // Image.asset(picture!),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              if (reps != null)
                Text(
                  "x${reps}",
                  style: TextStyle(color: Colors.grey),
                ),
              if (seconds != null)
                Text(
                  "00:${seconds}",
                  style: TextStyle(color: Colors.grey),
                )
            ],
          )
        ],
      ),
    );
  }
}
