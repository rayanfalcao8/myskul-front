import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/gradients.dart';

class GenderBox extends StatefulWidget {
  const GenderBox({
    super.key,
    required this.couleurs,
    required this.selectedGender,
    required this.gradients,
    this.icones,
    required this.textes,
    required this.condition,
    required this.gender,
    required this.width,
    required this.height,
  });

  final ColorHelper couleurs;
  final int selectedGender;
  final GradientHelper gradients;
  final IconData? icones;
  final TextHelper textes;
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
      // width: 140,
      // height: 80,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: widget.couleurs.green),
            bottom: BorderSide(color: widget.couleurs.green),
            left: BorderSide(color: widget.couleurs.green),
            right: BorderSide(color: widget.couleurs.green),
          ),
          color: widget.selectedGender == widget.condition
              ? null
              : widget.couleurs.white,
          gradient: widget.selectedGender == widget.condition
              ? widget.gradients.greenGradient
              : null,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: widget.icones != null ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icones,
            color: widget.selectedGender == widget.condition
                ? widget.couleurs.white
                : widget.couleurs.green,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.gender.tr,
            style: widget.textes.h4b.copyWith(
                color: widget.selectedGender == widget.condition
                    ? widget.couleurs.white
                    : widget.couleurs.green),
                    textAlign: TextAlign.center,
          )
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.gender.tr,
            style: widget.textes.h4b.copyWith(
                color: widget.selectedGender == widget.condition
                    ? widget.couleurs.white
                    : widget.couleurs.green),
                    textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
