import 'package:flutter/material.dart';
import 'package:myskul/utilities/helpers.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Détails produit", context: context),
      body: ListView(
        children: [
          Container(),
        ],
      ),
    );
  }
}
