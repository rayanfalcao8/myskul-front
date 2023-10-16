import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:myskul/models/product.dart';
import 'package:myskul/screens/shop/purchase_product.dart';
import 'package:myskul/utilities/helpers.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: "Détails produit", context: context, setShape: false),
      body: Container(
        color: Color(0xFF22987F),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: CachedNetworkImage(
                width: 300,
                imageUrl: product.pictureURL!,
                placeholder: (context, url) => Container(
                    width: 50, height: 50, child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Icon(Icons.not_accessible),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                    bottom: Radius.circular(0),
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          product.name!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.48),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          "${product.price} FCFA",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.48),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          product.description!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => PurchaseProduct(product: product));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Center(
                                child: Text(
                                  "ACHETER",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFF22987F),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF22987F)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
