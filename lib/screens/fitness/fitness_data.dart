import 'package:myskul/models/workout.dart';

List<Workout> getAbsWorkouts({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [
          jJacks(seconds: 20),
          crunchAbs(reps: 16),
          tRuss(reps: 20),
          escalade(reps: 16),
          touchTal(reps: 20),
          liftLegs(reps: 16),
          plank(seconds: 20),
          crunchAbs(reps: 12),
          tRuss(reps: 32),
          escalade(reps: 12),
          touchTal(reps: 20),
          liftLegs(reps: 14),
          plank(seconds: 30),
          cobraStretch(seconds: 30),
          eltg(seconds: 30),
          eltd(seconds: 30)
        ];
      }
    case 2:
      {
        return [];
      }
    case 3:
      {
        return [];
      }
    default:
      {
        return [];
      }
  }
}

List<Workout> getChestWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [];
      }
    case 2:
      {
        return [];
      }
    case 3:
      {
        return [];
      }
    default:
      {
        return [];
      }
  }
}

List<Workout> getArmsWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [];
      }
    case 2:
      {
        return [];
      }
    case 3:
      {
        return [];
      }
    default:
      {
        return [];
      }
  }
}

List<Workout> getLegsWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [];
      }
    case 2:
      {
        return [];
      }
    case 3:
      {
        return [];
      }
    default:
      {
        return [];
      }
  }
}

List<Workout> getShouldersWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [];
      }
    case 2:
      {
        return [];
      }
    case 3:
      {
        return [];
      }
    default:
      {
        return [];
      }
  }
}

Workout jJacks({required int seconds}) {
  return Workout(title: "Jumping jacks", seconds: seconds);
}

Workout crunchAbs({required int reps}) {
  return Workout(title: "Crunch abdominal", reps: reps);
}

Workout tRuss({required int reps}) {
  return Workout(title: "Twist russe", reps: reps);
}

Workout escalade({required int reps}) {
  return Workout(title: "Escalade", reps: reps);
}

Workout touchTal({required int reps}) {
  return Workout(title: "Toucher les talons", reps: reps);
}

Workout liftLegs({required int reps}) {
  return Workout(title: "Levé de jambes", reps: reps);
}

Workout plank({required int seconds}) {
  return Workout(title: "Planche", seconds: seconds);
}

Workout cobraStretch({required int seconds}) {
  return Workout(title: "Etirement cobra", seconds: seconds);
}

Workout eltg({required int seconds}) {
  return Workout(title: "Etirement lombaire torsion gauche", seconds: seconds);
}

Workout eltd({required int seconds}) {
  return Workout(title: "Etirement lombaire torsion droite", seconds: seconds);
}
