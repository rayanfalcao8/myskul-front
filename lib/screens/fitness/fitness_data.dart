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
        return [
          jJacks(seconds: 30),
          pams(reps: 16),
          pslg(reps: 12),
          pompes(reps: 10),
          pabe(reps: 10),
          pams(reps: 12),
          pgas(reps: 12),
          pabe(reps: 10),
          hinduPomps(reps: 10),
          cobraStretch(seconds: 20),
          bustStretch(seconds: 20)
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

List<Workout> getArmsWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [
          armsLift(seconds: 30),
          elb(seconds: 30),
          chearDips(reps: 10),
          cbsam(seconds: 30),
          cbsiam(seconds: 30),
          diamondPushUps(reps: 6),
          jJacks(seconds: 30),
          prayer(seconds: 16),
          cjbg(reps: 8),
          cjbd(reps: 8),
          diagPlanch(reps: 10),
          punch(seconds: 30),
          pompes(reps: 10),
          chenille(reps: 8),
          wallPushUp(reps: 12),
          etg(seconds: 30),
          etd(seconds: 30),
          edbg(seconds: 30),
          edbd(seconds: 30)
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

List<Workout> getLegsWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [
          sideJump(seconds: 30),
          squats(reps: 12),
          squats(reps: 12),
          ljag(reps: 12),
          ljad(reps: 12),
          ljag(reps: 12),
          ljad(reps: 12),
          backF(reps: 14),
          backF(reps: 14),
          dkg(reps: 16),
          dkd(reps: 16),
          dkg(reps: 16),
          dkd(reps: 16),
          eqgcm(seconds: 30),
          eqdcm(seconds: 30),
          eggvp(seconds: 30),
          edgvp(seconds: 30),
          emcm(reps: 12),
          emcm(reps: 12),
          ssemcm(reps: 12),
          ssemcm(reps: 12),
          emg(seconds: 30),
          emd(seconds: 30)
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

List<Workout> getShouldersWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [
          jJacks(seconds: 30),
          armsLift(seconds: 16),
          rhomStretch(reps: 14),
          elb(seconds: 16),
          pslg(reps: 14),
          easg(seconds: 30),
          easd(seconds: 30),
          cdb(seconds: 30),
          rhomStretch(reps: 12),
          elb(seconds: 14),
          pslg(reps: 12),
          pcv(seconds: 30),
          ptv(reps: 14),
          cir(reps: 12),
          ptv(reps: 14),
          cir(reps: 12),
          childPosture(seconds: 30)
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

// Workouts

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

Workout pams({required int reps}) {
  return Workout(title: "Pompes avec mains surélevées", reps: reps);
}

Workout pslg({required int reps}) {
  return Workout(title: "Pompes sur les genoux", reps: reps);
}

Workout pompes({required int reps}) {
  return Workout(title: "Pompes", reps: reps);
}

Workout pgas({required int reps}) {
  return Workout(title: "Pompes genoux au sol", reps: reps);
}

Workout pabe({required int reps}) {
  return Workout(title: "Pompes avec bras écartés", reps: reps);
}

Workout hinduPomps({required int reps}) {
  return Workout(title: "Pompes hindu", reps: reps);
}

Workout bustStretch({required int seconds}) {
  return Workout(title: "Etirement du Buste", seconds: seconds);
}

Workout armsLift({required int seconds}) {
  return Workout(title: "Levé de bras", seconds: seconds);
}

Workout elb({required int seconds}) {
  return Workout(title: "Elevation Latéral des Bras", seconds: seconds);
}

Workout chearDips({required int reps}) {
  return Workout(title: "Triceps: dips sur chaise", reps: reps);
}

Workout cbsam({required int seconds}) {
  return Workout(
      title: "Cerceles de Bras dans le Sens des Aiguilles d'une montre",
      seconds: seconds);
}

Workout cbsiam({required int seconds}) {
  return Workout(
      title: "Cerceles de Bras dans le Sens inverse des Aiguilles d'une montre",
      seconds: seconds);
}

Workout diamondPushUps({required int reps}) {
  return Workout(title: "Pompes diamant", reps: reps);
}

Workout prayer({required int seconds}) {
  return Workout(title: "La prière", seconds: seconds);
}

Workout cjbg({required int reps}) {
  return Workout(title: "Curl de jambe à la barre gauche", reps: reps);
}

Workout cjbd({required int reps}) {
  return Workout(title: "Curl de jambe à la barre droite", reps: reps);
}

Workout diagPlanch({required int reps}) {
  return Workout(title: "Planche diagonale", reps: reps);
}

Workout punch({required int seconds}) {
  return Workout(title: "Coup de poing", seconds: seconds);
}

Workout chenille({required int reps}) {
  return Workout(title: "Chenille", reps: reps);
}

Workout wallPushUp({required int reps}) {
  return Workout(title: "Pompes contre le mur", reps: reps);
}

Workout etg({required int seconds}) {
  return Workout(title: "Etirement du triceps gauche", seconds: seconds);
}

Workout etd({required int seconds}) {
  return Workout(title: "Etirement du triceps droit", seconds: seconds);
}

Workout edbg({required int seconds}) {
  return Workout(title: "Etirement debout du biceps gauche", seconds: seconds);
}

Workout edbd({required int seconds}) {
  return Workout(title: "Etirement debout du biceps droit", seconds: seconds);
}

Workout sideJump({required int seconds}) {
  return Workout(title: "Saut de côté", seconds: seconds);
}

Workout squats({required int reps}) {
  return Workout(title: "Squats", reps: reps);
}

Workout ljag({required int reps}) {
  return Workout(title: "Levé de jambe allongé gauche", reps: reps);
}

Workout ljad({required int reps}) {
  return Workout(title: "Levé de jambe allongé droit", reps: reps);
}

Workout backF({required int reps}) {
  return Workout(title: "Fente arrière", reps: reps);
}

Workout dkg({required int reps}) {
  return Workout(title: "Donkey kicks gauche", reps: reps);
}

Workout dkd({required int reps}) {
  return Workout(title: "Donkey kicks droite", reps: reps);
}

Workout eqgcm({required int seconds}) {
  return Workout(
      title: "Etirement du quadriceps gauche contre le mur", seconds: seconds);
}

Workout eqdcm({required int seconds}) {
  return Workout(
      title: "Etirement du quadriceps droit contre le mur", seconds: seconds);
}

Workout eggvp({required int seconds}) {
  return Workout(
      title: "Etirement gauche genou vers poitrine", seconds: seconds);
}

Workout edgvp({required int seconds}) {
  return Workout(
      title: "Etirement droit genou vers poitrine", seconds: seconds);
}

Workout emcm({required int reps}) {
  return Workout(title: "Extension des mollets contre le mur", reps: reps);
}

Workout ssemcm({required int reps}) {
  return Workout(
      title: "Squats de sumo et extension des mollets contre le mur",
      reps: reps);
}

Workout emg({required int seconds}) {
  return Workout(title: "Etirement du mollet gauche", seconds: seconds);
}

Workout emd({required int seconds}) {
  return Workout(title: "Etirement du mollet droit", seconds: seconds);
}

Workout rhomStretch({required int reps}) {
  return Workout(title: "Etirement des rhomboïdes", reps: reps);
}

Workout easg({required int seconds}) {
  return Workout(
      title: "Etirement allongé sur le sol gauche", seconds: seconds);
}

Workout easd({required int seconds}) {
  return Workout(title: "Etirement allongé sur le sol droit", seconds: seconds);
}

Workout cdb({required int seconds}) {
  return Workout(title: "Ciseaux de bras", seconds: seconds);
}

Workout pcv({required int seconds}) {
  return Workout(title: "Posture Chat Vache", seconds: seconds);
}

Workout ptv({required int reps}) {
  return Workout(title: "Pompes triceps sur le ventre", reps: reps);
}

Workout cir({required int reps}) {
  return Workout(title: "Contractions inclinées des rhomboïdes", reps: reps);
}

Workout childPosture({required int seconds}) {
  return Workout(title: "Posture de l'enfant", seconds: seconds);
}
