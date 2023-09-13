import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

class NewInput extends StatelessWidget {
  const NewInput({
    required this.controller,
    required this.onSubmit,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.errorText,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final void Function(String a) onSubmit;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String hintText;
  final Icon? prefixIcon;
  final String? errorText;
  final bool readOnly;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          height: 51,
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            onSubmitted: onSubmit,
            maxLength: 25,
            onTap: onTap,
            readOnly: readOnly,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(right: 5),
                hintText: hintText.tr,
                counterText: '',
                hintStyle: TextHelper().h4l.copyWith(
                    color: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? ColorHelper().green
                            : ColorHelper().grey)),
                prefixIcon: prefixIcon,
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? ColorHelper().green
                        : ColorHelper().grey),
                focusColor: ColorHelper().green,
                hoverColor: ColorHelper().green,
                fillColor: ColorHelper().green,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorHelper().grey, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorHelper().red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorHelper().green,
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
