import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class DropdownMenuInput extends StatelessWidget {
  final String? hintText;
  // final Icon? prefixIcon;
  final List<DropdownMenuItem<int>> items;
  final int? defaultValue;
  final void Function(int?) onChanged;
  final String? Function(int? value)? validator;

  const DropdownMenuInput({
    super.key,
    this.hintText,
    // this.prefixIcon,
    required this.items,
    this.defaultValue,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        decoration: getInputDecoration(hintText: hintText),
        items: items,
        value: defaultValue,
        validator: validator,
        onChanged: onChanged);
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;

  const TextFieldInput({
    super.key,
    required this.controller,
    required this.validator,
    this.textInputType,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: getInputDecoration(hintText: hintText),
    );
  }
}

class ButtonInput extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? width;
  final bool putIconLeft;

  const ButtonInput(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.putIconLeft = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
          width: width,
          height: 50,
          child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(ColorHelper().green),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                )),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (putIconLeft)
                    CircleAvatar(
                      backgroundColor: ColorHelper().white,
                      child: Icon(
                        IconHelper().back,
                        color: ColorHelper().green,
                        size: 15,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(text.tr,
                        style: GoogleFonts.getFont('Lato',
                            textStyle: TextHelper()
                                .h4b
                                .copyWith(color: ColorHelper().white))),
                  ),
                  if (!putIconLeft)
                    CircleAvatar(
                      backgroundColor: ColorHelper().white,
                      child: Icon(
                        IconHelper().forward,
                        color: ColorHelper().green,
                        size: 15,
                      ),
                    )
                ],
              ))),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, bottom: 5),
      child: Text(label),
    );
  }
}
