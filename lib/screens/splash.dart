import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class Splash extends StatelessWidget {
  var couleurs = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash.jpg"),
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
            Container(
              color: couleurs.lightGreen.withOpacity(0.6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   "assets/images/logo2.png",
                    //   width: 100,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apprendre",
                          style: GoogleFonts.getFont('Lato',
                              textStyle:
                                  textes.xxlb.copyWith(color: couleurs.white)),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "devient plus facile !",
                          style: GoogleFonts.getFont('Lato',
                              textStyle:
                                  textes.xxlb.copyWith(color: couleurs.white)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Révisez et renforcez ",
                          style: GoogleFonts.getFont('Lato',
                              textStyle:
                                  textes.h1r.copyWith(color: couleurs.white)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "vos connaissances ou que vous soyez",
                          style: GoogleFonts.getFont('Lato',
                              textStyle:
                                  textes.h1r.copyWith(color: couleurs.white)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 70,
                    ),

                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){ return Login();}));},
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text("COMMENCER",
                                  style: GoogleFonts.getFont('Lato',
                                      textStyle: textes.h3b.copyWith(
                                          color: couleurs.green))),
                              CircleAvatar(
                                backgroundColor: couleurs.green,
                                child: Icon(
                                  icones.forward,
                                  color: couleurs.white,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all(couleurs.white),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
