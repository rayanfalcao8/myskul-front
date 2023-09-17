import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

class DropdownMenuInput extends StatelessWidget {
  final String hintText;
  // final Icon? prefixIcon;
  final List<DropdownMenuItem<int>> items;
  final void Function(int?) onChanged;

  const DropdownMenuInput({
    super.key,
    required this.hintText,
    // this.prefixIcon,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText.tr,
            counterText: '',
            hintStyle: TextHelper().h4l.copyWith(
                color: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? ColorHelper().green
                        : ColorHelper().grey)),
            // prefixIcon: prefixIcon,
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
        items: items,
        onChanged: onChanged);
    ;
  }
}
