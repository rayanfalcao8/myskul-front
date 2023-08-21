import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NewInputInter extends StatelessWidget {
  const NewInputInter({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.keyboardType,
    required this.hintText,
    required this.textes,
    required this.couleurs,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final Null Function(String a) onSubmit;
  final TextInputType keyboardType;
  final String hintText;
  final TextHelper textes;
  final ColorHelper couleurs;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 51,
          child: IntlPhoneField(
            controller: controller,
            onSubmitted: onSubmit,
            languageCode: "fr",
            // ignore: deprecated_member_use
            searchText: "Recherche",
            decoration: InputDecoration(
              hintText: hintText.tr,
                hintStyle: textes.h4l.copyWith(
                    color: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? couleurs.green
                            : couleurs.grey)),
                prefixIcon: prefixIcon,
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? couleurs.green
                        : couleurs.grey),
                focusColor: couleurs.green,
                hoverColor: couleurs.green,
                fillColor: couleurs.green,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: couleurs.grey, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: couleurs.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: couleurs.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            initialCountryCode: 'CM',
            showDropdownIcon: false,
            disableLengthCheck: true,
          ),
        ),

         SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
