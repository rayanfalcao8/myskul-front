import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class NewButtonD extends StatelessWidget {
  const NewButtonD({
    super.key,
    required this.textes,
    required this.couleurs,
    required this.icones,
    required this.text,
    this.function,
  });

  final TextHelper textes;
  final ColorHelper couleurs;
  final IconHelper icones;
  final String text;
  final Function()?  function;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        
      },
      child: SizedBox(
        width: 270,
        height: 50,
        child: TextButton(
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: couleurs.white,
                  child: Icon(
                    icones.back,
                    color: couleurs.green,
                    size: 15,
                  ),
                ),
                Text(text,
                    style: GoogleFonts.getFont('Lato',
                        textStyle: textes.h4b.copyWith(color: couleurs.white))),
                SizedBox(),
                 SizedBox(),
              ],
            ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(couleurs.green),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            )),
          ),
        ),
      ),
    );
  }
}
