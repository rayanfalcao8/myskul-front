import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NewInputInter extends StatelessWidget {
  const NewInputInter({
    required this.controller,
    required this.onSubmit,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final Null Function(String a) onSubmit;
  final TextInputType keyboardType;
  final String hintText;
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
            languageCode: Get.locale.toString().contains('en') ? "en" : "fr",
            // ignore: deprecated_member_use
            searchText: "search".tr,
            decoration: InputDecoration(
                hintText: hintText.tr,
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
