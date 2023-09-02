import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class NewButtonG extends StatelessWidget {
  const NewButtonG({
    required this.text,
    this.function,
  });

  final String text;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 50,
      child: TextButton(
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              SizedBox(),
              Text(text.tr,
                  style: GoogleFonts.getFont('Lato',
                      textStyle: TextHelper()
                          .h4b
                          .copyWith(color: ColorHelper().white))),
              CircleAvatar(
                backgroundColor: ColorHelper().white,
                child: Icon(
                  IconHelper().forward,
                  color: ColorHelper().green,
                  size: 15,
                ),
              )
            ],
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(ColorHelper().green),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          )),
        ),
      ),
    );
  }
}
