import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';


class NewButtonG extends StatelessWidget {
  const NewButtonG({
    super.key,
    required this.textes,
    required this.couleurs,
    required this.icones,
    required this.text,
  });

  final TextHelper textes;
  final ColorHelper couleurs;
  final IconHelper icones;
   final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 50,
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(text,
                  style: GoogleFonts.getFont('Lato',
                      textStyle: textes.h4b
                          .copyWith(color: couleurs.white))),
              CircleAvatar(
                backgroundColor: couleurs.white,
                child: Icon(
                  icones.forward,
                  color: couleurs.green,
                  size: 15,
                ),
              )
            ],
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          backgroundColor:
              MaterialStateProperty.all(couleurs.green),
          shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          )),
        ),
      ),
    );
  }
}
