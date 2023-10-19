import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/controllers/product_controller.dart';
import 'package:myskul/models/product.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => LibraryPageState();
}

class LibraryPageState extends State<LibraryPage> {
  var colors = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();
  var gradients = GradientHelper();
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _products = await ProductController.getByUser();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: "Bibliothèque", context: context),
        body: Container(
          decoration: getBckDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colors.grey.withOpacity(0.1),
                  prefixIcon: Icon(Icons.search, color: colors.black),
                  hintText: "search".tr,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: !_products.isEmpty
                    ? ListView(
                        children: List.generate(_products.length,
                            (index) => _buildProduct(_products[index])),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning,
                            size: 64.0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Vous n'avez aucun produit",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
              )
            ]),
          ),
        ));
  }

  Widget _buildProduct(Product product) {
    return InkWell(
        // onTap: () => Get.to(() => ProductDetail(product: product)),
        child: Card(
      child: Container(
        width: double.infinity,
        height: 74,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72ffffff),
          border: Border.all(
            color: const Color(0xFF2BB799),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TITRE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2BB799),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "TAILLE : 10.0Mo",
                      style: TextStyle(
                        color: Color.fromARGB(112, 74, 72, 72),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 63.859649658203125,
              height: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff2bb799),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 38,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
