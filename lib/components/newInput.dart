import 'package:flutter/material.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

class NewInput extends StatelessWidget {
  const NewInput({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.keyboardType,
    required this.hintText,
    required this.textes,
    required this.couleurs,
    required this.prefixIcon,
    this.errorText,
  });

  final TextEditingController controller;
  final Null Function(String a) onSubmit;
  final TextInputType keyboardType;
  final String hintText;
  final TextHelper textes;
  final ColorHelper couleurs;
  final Icon prefixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 51,
          child: TextField(
            controller: controller,
            onSubmitted: onSubmit,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
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
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
