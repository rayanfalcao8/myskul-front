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
        return [
          jJacks(seconds: 30),
          touchTal(reps: 26),
          crossCrunch(reps: 20),
          escalade(reps: 20),
          plg(reps: 12),
          pld(reps: 12),
          hanchesPont(reps: 20),
          ctv(reps: 20),
          vAbs(reps: 20),
          touchTal(reps: 26),
          crunchAbs(reps: 20),
          plank(seconds: 30),
          crossCrunch(reps: 20),
          liftLegs(reps: 16),
          ctv(reps: 20),
          pushupAndRot(reps: 20),
          rightPlank(seconds: 20),
          leftPlank(seconds: 20),
          cobraStretch(seconds: 30),
          eltg(seconds: 30),
          eltd(seconds: 30)
        ];
      }
    case 3:
      {
        return [
          jJacks(seconds: 30),
          abs(reps: 20),
          plg(reps: 20),
          pld(reps: 20),
          crunchAbs(reps: 30),
          ctv(reps: 24),
          rightPlank(seconds: 20),
          leftPlank(seconds: 20),
          vAbs(reps: 18),
          pushupAndRot(reps: 24),
          tRuss(reps: 48),
          crunchAbs(reps: 28),
          hanchesPont(reps: 30),
          touchTal(reps: 34),
          escalade(reps: 30),
          crossCrunch(reps: 24),
          vAbs(reps: 16),
          plank(seconds: 60),
          cobraStretch(seconds: 30),
          eltg(seconds: 30),
          eltd(seconds: 30)
        ];
      }
    default:
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
  }
}

List<Workout> getChestWorkout({int level = 1}) {
  switch (level) {
    case 1:
      {
        return [
          jJacks(seconds: 30),
          pams(reps: 16),
          kneePushups(reps: 12),
          pushups(reps: 10),
          pabe(reps: 10),
          pams(reps: 12),
          pgas(reps: 12),
          pabe(reps: 10),
          hinduPushups(reps: 10),
          cobraStretch(seconds: 20),
          bustStretch(seconds: 20)
        ];
      }
    case 2:
      {
        return [
          jJacks(seconds: 30),
          kneePushups(reps: 12),
          pushups(reps: 12),
          pabe(reps: 16),
          hinduPushups(reps: 12),
          quirkyPushups(reps: 12),
          pushupAndRot(reps: 10),
          kneePushups(reps: 10),
          hinduPushups(reps: 10),
          pps(reps: 12),
          quirkyPushups(reps: 10),
          shauldersStretch(seconds: 30),
          cobraStretch(seconds: 30),
          bustStretch(seconds: 30)
        ];
      }
    case 3:
      {
        return [
          jJacks(seconds: 30),
          circleWithArms(reps: 20),
          shauldersStretch(seconds: 30),
          burpees(reps: 10),
          quirkyPushups(reps: 16),
          hinduPushups(reps: 16),
          pushupAndRot(reps: 12),
          diamondPushUps(reps: 16),
          kneePushups(reps: 12),
          hinduPushups(reps: 12),
          spidermanPushups(reps: 20),
          pps(reps: 12),
          burpees(reps: 10),
          shauldersStretch(seconds: 30),
          cobraStretch(seconds: 30),
          bustStretch(seconds: 30)
        ];
      }
    default:
      {
        return [
          jJacks(seconds: 30),
          pams(reps: 16),
          kneePushups(reps: 12),
          pushups(reps: 10),
          pabe(reps: 10),
          pams(reps: 12),
          pgas(reps: 12),
          pabe(reps: 10),
          hinduPushups(reps: 10),
          cobraStretch(seconds: 20),
          bustStretch(seconds: 20)
        ];
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
          pushups(reps: 10),
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
        return [
          cbsam(seconds: 30),
          cbsiam(seconds: 30),
          floorDips(reps: 14),
          militryPushups(reps: 12),
          altCrochets(seconds: 30),
          pushupAndRot(reps: 12),
          cjbg(reps: 12),
          cjbd(reps: 12),
          floorDips(reps: 12),
          militryPushups(reps: 10),
          altCrochets(seconds: 30),
          pushupAndRot(reps: 10),
          cjbg(reps: 10),
          cjbd(reps: 10),
          jumpWithoutRope(seconds: 30),
          pushups(reps: 14),
          burpees(reps: 10),
          armCis(seconds: 30),
          jumpWithoutRope(seconds: 30),
          pushups(reps: 12),
          burpees(reps: 8),
          etg(seconds: 30),
          etd(seconds: 30),
          edbg(seconds: 30),
          edbd(seconds: 30)
        ];
      }
    case 3:
      {
        return [
          cbsam(seconds: 30),
          cbsiam(seconds: 30),
          jumpWithoutRope(seconds: 30),
          cjbg(reps: 16),
          cjbd(reps: 16),
          burpees(reps: 16),
          ccbg(reps: 14),
          ccbd(reps: 14),
          floorDips(reps: 18),
          altCrochets(seconds: 30),
          militryPushups(reps: 14),
          crocoShaulders(reps: 16),
          floorDips(reps: 16),
          altCrochets(seconds: 30),
          burpees(reps: 16),
          ccbg(reps: 12),
          ccbd(reps: 12),
          militryPushups(reps: 12),
          crocoShaulders(reps: 16),
          cpg(reps: 8),
          cpd(reps: 8),
          pmmb(seconds: 30),
          prayer(seconds: 18),
          pushupAndRot(reps: 12),
          etg(seconds: 30),
          etd(seconds: 30),
          edbg(seconds: 30),
          edbd(seconds: 30)
        ];
      }
    default:
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
          pushups(reps: 10),
          chenille(reps: 8),
          wallPushUp(reps: 12),
          etg(seconds: 30),
          etd(seconds: 30),
          edbg(seconds: 30),
          edbd(seconds: 30)
        ];
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
        return [
          jJacks(seconds: 30),
          squats(reps: 12),
          squats(reps: 12),
          squats(reps: 12),
          fireHydLeft(reps: 12),
          fireHydRight(reps: 12),
          fireHydLeft(reps: 12),
          fireHydRight(reps: 12),
          fireHydLeft(reps: 12),
          fireHydRight(reps: 12),
          fente(reps: 14),
          fente(reps: 14),
          cljg(reps: 12),
          cljd(reps: 12),
          cljg(reps: 12),
          cljd(reps: 12),
          sumoSquat(reps: 12),
          sumoSquat(reps: 12),
          sumoSquat(reps: 12),
          bji(reps: 12),
          bji(reps: 12),
          bji(reps: 12),
          cheer(seconds: 30),
          eqgcm(seconds: 30),
          eqdcm(seconds: 30),
          eggvp(seconds: 30),
          edgvp(seconds: 30),
          empe(reps: 12),
          empe(reps: 12),
          empe(reps: 12),
          scpjg(reps: 12),
          scpjd(reps: 12),
          scpjg(reps: 12),
          scpjd(reps: 12),
          emg(seconds: 30),
          emd(seconds: 30)
        ];
      }
    case 3:
      {
        return [
          burpees(reps: 10),
          squats(reps: 14),
          squats(reps: 14),
          squats(reps: 14),
          alcg(reps: 12),
          alcd(reps: 12),
          alcg(reps: 12),
          alcd(reps: 12),
          alcg(reps: 12),
          alcd(reps: 12),
          revSlot(reps: 14),
          revSlot(reps: 14),
          revSlot(reps: 14),
          cljg(reps: 12),
          cljd(reps: 12),
          cljg(reps: 12),
          cljd(reps: 12),
          cljg(reps: 12),
          cljd(reps: 12),
          jumpSquat(reps: 14),
          jumpSquat(reps: 14),
          jumpSquat(reps: 14),
          ljgqp(reps: 12),
          ljdqp(reps: 12),
          ljgqp(reps: 12),
          ljdqp(reps: 12),
          ljgqp(reps: 12),
          ljdqp(reps: 12),
          cheer(seconds: 40),
          eqgcm(seconds: 30),
          eqdcm(seconds: 30),
          epa(seconds: 30),
          empcm(reps: 16),
          empcm(reps: 16),
          empcm(reps: 16),
          emgrcm(reps: 16),
          emdrcm(reps: 16),
          emgrcm(reps: 16),
          emdrcm(reps: 16),
          emgrcm(reps: 16),
          emdrcm(reps: 16),
          emg(seconds: 30),
          emd(seconds: 30)
        ];
      }
    default:
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
          kneePushups(reps: 14),
          easg(seconds: 30),
          easd(seconds: 30),
          armCis(seconds: 30),
          rhomStretch(reps: 12),
          elb(seconds: 14),
          kneePushups(reps: 12),
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
        return [
          jJacks(seconds: 30),
          kickbackTriceps(reps: 14),
          pams(reps: 14),
          rhomStretch(reps: 12),
          floorDips(reps: 16),
          pcv(seconds: 30),
          kickbackTriceps(reps: 14),
          pams(reps: 12),
          forwardFlex(reps: 10),
          floorDips(reps: 14),
          easg(seconds: 30),
          easd(seconds: 30),
          altPushups(reps: 14),
          supermanSwim(reps: 14),
          altPushups(reps: 12),
          supermanSwim(reps: 12),
          childPosture(seconds: 30),
        ];
      }
    case 3:
      {
        return [
          jJacks(seconds: 30),
          hyperExt(reps: 14),
          pickPushups(reps: 14),
          reversePushups(reps: 12),
          chenille(reps: 16),
          easg(seconds: 30),
          easd(seconds: 30),
          hyperExt(reps: 12),
          pickPushups(reps: 12),
          reversePushups(reps: 10),
          chenille(reps: 14),
          pcv(seconds: 30),
          pcd(reps: 14),
          esy(reps: 14),
          pcd(reps: 12),
          reverseSnowAngels(reps: 12),
          childPosture(seconds: 30)
        ];
      }
    default:
      {
        return [
          jJacks(seconds: 30),
          armsLift(seconds: 16),
          rhomStretch(reps: 14),
          elb(seconds: 16),
          kneePushups(reps: 14),
          easg(seconds: 30),
          easd(seconds: 30),
          armCis(seconds: 30),
          rhomStretch(reps: 12),
          elb(seconds: 14),
          kneePushups(reps: 12),
          pcv(seconds: 30),
          ptv(reps: 14),
          cir(reps: 12),
          ptv(reps: 14),
          cir(reps: 12),
          childPosture(seconds: 30)
        ];
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

Workout kneePushups({required int reps}) {
  return Workout(title: "Pompes sur les genoux", reps: reps);
}

Workout pushups({required int reps}) {
  return Workout(title: "Pompes", reps: reps);
}

Workout pgas({required int reps}) {
  return Workout(title: "Pompes genoux au sol", reps: reps);
}

Workout pabe({required int reps}) {
  return Workout(title: "Pompes avec bras écartés", reps: reps);
}

Workout hinduPushups({required int reps}) {
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

Workout armCis({required int seconds}) {
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

Workout crossCrunch({required int reps}) {
  return Workout(title: "Crunchs croisés", reps: reps);
}

Workout plg({required int reps}) {
  return Workout(title: "Pont latéral gauche", reps: reps);
}

Workout pld({required int reps}) {
  return Workout(title: "Pont latéral droit", reps: reps);
}

Workout hanchesPont({required int reps}) {
  return Workout(title: "Hanches pont", reps: reps);
}

Workout ctv({required int reps}) {
  return Workout(title: "Crunch de type vélo", reps: reps);
}

Workout vAbs({required int reps}) {
  return Workout(title: "Abdominaux en V", reps: reps);
}

Workout pushupAndRot({required int reps}) {
  return Workout(title: "Pompes & Rotation", reps: reps);
}

Workout rightPlank({required int seconds}) {
  return Workout(title: "Planche sur la droite", seconds: seconds);
}

Workout leftPlank({required int seconds}) {
  return Workout(title: "Planche sur la gauche", seconds: seconds);
}

Workout quirkyPushups({required int reps}) {
  return Workout(title: "Pompes décalées", reps: reps);
}

Workout pps({required int reps}) {
  return Workout(title: "Pompes avec pieds surélevés", reps: reps);
}

Workout shauldersStretch({required int seconds}) {
  return Workout(title: "Etirement des épaules", seconds: seconds);
}

Workout altCrochets({required int seconds}) {
  return Workout(title: "Crochets alternés", seconds: seconds);
}

Workout militryPushups({required int reps}) {
  return Workout(title: "Pompes militaires", reps: reps);
}

Workout floorDips({required int reps}) {
  return Workout(title: "Dips au sol", reps: reps);
}

Workout jumpWithoutRope({required int seconds}) {
  return Workout(title: "Sauter sans corde", seconds: seconds);
}

Workout burpees({required int reps}) {
  return Workout(title: "Burpees", reps: reps);
}

Workout fireHydRight({required int reps}) {
  return Workout(title: "Fire hydrant droite", reps: reps);
}

Workout fireHydLeft({required int reps}) {
  return Workout(title: "Fire hydrant gauche", reps: reps);
}

Workout fente({required int reps}) {
  return Workout(title: "Fente", reps: reps);
}

Workout cljg({required int reps}) {
  return Workout(title: "Cercles latéraux avec la jambe gauche", reps: reps);
}

Workout cljd({required int reps}) {
  return Workout(title: "Cercles latéraux avec la jambe droite", reps: reps);
}

Workout sumoSquat({required int reps}) {
  return Workout(title: "Squat de sumo", reps: reps);
}

Workout bji({required int reps}) {
  return Workout(title: "Battements de jambes inversés", reps: reps);
}

Workout cheer({required int seconds}) {
  return Workout(title: "La chaise", seconds: seconds);
}

Workout empe({required int reps}) {
  return Workout(title: "Extension des mollets avec pieds écartés", reps: reps);
}

Workout scpjg({required int reps}) {
  return Workout(title: "Saut à cloche-pied sur jambe gauche", reps: reps);
}

Workout scpjd({required int reps}) {
  return Workout(title: "Saut à cloche-pied sur jambe droite", reps: reps);
}

Workout kickbackTriceps({required int reps}) {
  return Workout(title: "Kickbacks triceps", reps: reps);
}

Workout forwardFlex({required int reps}) {
  return Workout(title: "Flexion avant", reps: reps);
}

Workout altPushups({required int reps}) {
  return Workout(title: "Pompes alternées", reps: reps);
}

Workout supermanSwim({required int reps}) {
  return Workout(title: "Superman et nageur", reps: reps);
}

Workout hyperExt({required int reps}) {
  return Workout(title: "Hyper-extension", reps: reps);
}

Workout pickPushups({required int reps}) {
  return Workout(title: "Pompes piquées", reps: reps);
}

Workout reversePushups({required int reps}) {
  return Workout(title: "Pompes inversées", reps: reps);
}

Workout pcd({required int reps}) {
  return Workout(title: "Pompes couchées sur le dos", reps: reps);
}

Workout esy({required int reps}) {
  return Workout(title: "Elevation au sol en Y", reps: reps);
}

Workout reverseSnowAngels({required int reps}) {
  return Workout(title: "Anges de neige inversés", reps: reps);
}

Workout alcg({required int reps}) {
  return Workout(title: "Adducteurs latéraux couché gauche", reps: reps);
}

Workout alcd({required int reps}) {
  return Workout(title: "Adducteurs latéraux couché droite", reps: reps);
}

Workout revSlot({required int reps}) {
  return Workout(title: "Fente de révérence", reps: reps);
}

Workout jumpSquat({required int reps}) {
  return Workout(title: "Squats avec saut", reps: reps);
}

Workout ljgqp({required int reps}) {
  return Workout(title: "Levé de jambe gauche à quatre pattes", reps: reps);
}

Workout ljdqp({required int reps}) {
  return Workout(title: "Levé de jambe droite à quatre pattes", reps: reps);
}

Workout epa({required int seconds}) {
  return Workout(title: "Etirement du papillon allongé", seconds: seconds);
}

Workout empcm({required int reps}) {
  return Workout(
      title: "Extension des mollets penché contre un mur", reps: reps);
}

Workout emgrcm({required int reps}) {
  return Workout(
      title: "Extension du mollet gauche avec résistance contre le mur",
      reps: reps);
}

Workout emdrcm({required int reps}) {
  return Workout(
      title: "Extension du mollet droit avec résistance contre le mur",
      reps: reps);
}

Workout ccbg({required int reps}) {
  return Workout(title: "Curls crunch bras gauche", reps: reps);
}

Workout ccbd({required int reps}) {
  return Workout(title: "Curls crunch bras droit", reps: reps);
}

Workout crocoShaulders({required int reps}) {
  return Workout(title: "Epaules crocodiles", reps: reps);
}

Workout cpg({required int reps}) {
  return Workout(title: "Curls porte gauches", reps: reps);
}

Workout cpd({required int reps}) {
  return Workout(title: "Curls porte droits", reps: reps);
}

Workout pmmb({required int seconds}) {
  return Workout(title: "Pompe modifiée maintien bas", seconds: seconds);
}

Workout circleWithArms({required int reps}) {
  return Workout(title: "Cercle avec bras", reps: reps);
}

Workout spidermanPushups({required int reps}) {
  return Workout(title: "Pompes spiderman", reps: reps);
}

Workout abs({required int reps}) {
  return Workout(title: "Abdominaux", reps: reps);
}
