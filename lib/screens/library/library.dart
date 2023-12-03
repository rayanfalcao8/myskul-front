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
  final double _height = 90;

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
        child: Card(
      child: Container(
        height: _height,
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
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text(
                      product.name!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2BB799),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2BB799),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // if (product.file != null)
                    //   Text(
                    //     "TAILLE : 10.0 Mo",
                    //     style: TextStyle(
                    //       color: Color.fromARGB(112, 74, 72, 72),
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (product.file != null && product.file!.isNotEmpty)
                    downloadFile(product.file!);
                },
                child: Container(
                  height: _height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (product.file != null && product.file!.isNotEmpty)
                        ? const Color(0xff2bb799)
                        : Color.fromARGB(255, 199, 199, 199),
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
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
