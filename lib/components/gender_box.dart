import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/gradients.dart';

class GenderBox extends StatefulWidget {
  const GenderBox({
    required this.selectedGender,
    this.icones,
    required this.condition,
    required this.gender,
    required this.width,
    required this.height,
  });

  final int selectedGender;
  final IconData? icones;
  final int condition;
  final String gender;
  final double width;
  final double height;

  @override
  State<GenderBox> createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: ColorHelper().green),
            bottom: BorderSide(color: ColorHelper().green),
            left: BorderSide(color: ColorHelper().green),
            right: BorderSide(color: ColorHelper().green),
          ),
          color: widget.selectedGender == widget.condition
              ? null
              : ColorHelper().white,
          gradient: widget.selectedGender == widget.condition
              ? GradientHelper().greenGradient
              : null,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: widget.icones != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icones,
                  color: widget.selectedGender == widget.condition
                      ? ColorHelper().white
                      : ColorHelper().green,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.gender.tr,
                  style: TextHelper().h4b.copyWith(
                      color: widget.selectedGender == widget.condition
                          ? ColorHelper().white
                          : ColorHelper().green),
                  textAlign: TextAlign.center,
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.gender.tr,
                  style: TextHelper().h4b.copyWith(
                      color: widget.selectedGender == widget.condition
                          ? ColorHelper().white
                          : ColorHelper().green),
                  textAlign: TextAlign.center,
                )
              ],
            ),
    );
  }
}
