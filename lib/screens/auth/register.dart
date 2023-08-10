import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/genderBox.dart';
import 'package:myskul/components/newInputInter.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/auth/terms.dart';
import 'package:myskul/screens/auth/domain.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/newButtonG.dart';
import 'package:myskul/components/newInput.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var noms = TextEditingController();

  var email = TextEditingController();

  var num = TextEditingController();

  var ville = TextEditingController();

  var datenaiss = TextEditingController();

  var password = TextEditingController();

  var passwordConfirm = TextEditingController();

  var selectedGender = 0;

  bool? checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2,
                decoration: BoxDecoration(
                    color: couleurs.white.withOpacity(0.5),
                    image: DecorationImage(
                        image: AssetImage("assets/images/math.png"),
                        opacity: 0.04,
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      top: 0.0,
                      child: Image.asset(
                        "assets/images/wave-t.png",
                      ),
                    ),
                    Container(),
                    Positioned(
                      bottom: 0.0,
                      child: Image.asset(
                        "assets/images/wave-b.png",
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset(
                        "assets/images/logo2.png",
                        width: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "NOUVEAU COMPTE",
                            style: GoogleFonts.getFont('Lato',
                                textStyle: textes.h1l),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      NewInput(
                          controller: noms,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.text,
                          hintText: "Noms et prénoms",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.user)),
                      NewInput(
                          controller: email,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Adresse Email",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.user)),
                      NewInputInter(
                          controller: num,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.phone,
                          hintText: "Numéro de téléphone",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.user)),
                      NewInput(
                          controller: ville,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.text,
                          hintText: "Ville de résidence",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.city)),
                      NewInput(
                          controller: datenaiss,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.datetime,
                          hintText: "Date de naissance",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.calendar)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 0;
                              });
                            },
                            child: GenderBox(
                              couleurs: couleurs,
                              selectedGender: selectedGender,
                              gradients: gradients,
                              icones: icones.boy,
                              textes: textes,
                              condition: 0,
                              gender: "HOMME",
                              width: 140,
                              height: 80,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 1;
                              });
                            },
                            child: GenderBox(
                              couleurs: couleurs,
                              selectedGender: selectedGender,
                              gradients: gradients,
                              icones: icones.girl,
                              textes: textes,
                              condition: 1,
                              gender: "FEMME",
                              width: 140,
                              height: 80,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewInput(
                          controller: password,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Mot de passe",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.lock)),
                      NewInput(
                          controller: passwordConfirm,
                          onSubmit: (g) {},
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Confirmation du mot de passe",
                          textes: textes,
                          couleurs: couleurs,
                          prefixIcon: Icon(icones.lock)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: checkbox,
                              onChanged: (v) {
                                setState(() {
                                  checkbox = v;
                                });
                              }),
                          Row(
                            children: [
                              Text(
                                "J’ai lu et j’accepte",
                                style: textes.h4l,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Term();
                                  }));
                                },
                                child: Text(" les Termes et conditions",
                                    style: textes.h4l
                                        .copyWith(color: couleurs.green)),
                              )
                            ],
                          ),
                        ],
                      ),
                      NewButtonG(
                        textes: textes,
                        couleurs: couleurs,
                        icones: icones,
                        text: "S'ENGREGISTRER",
                        function: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Domain();
                          }));
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Déjà inscrit ? ",
                            style: textes.h4l,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            },
                            child: Text(
                              "Se connecter",
                              style: textes.h4l.copyWith(color: couleurs.green),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
