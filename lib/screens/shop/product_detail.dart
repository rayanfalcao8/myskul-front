import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:myskul/models/product.dart';
import 'package:myskul/screens/shop/purchase_product.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myskul/models/user.dart';


class ProductDetail extends StatelessWidget {
  ProductDetail({super.key, required this.product});
  final Product product;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
                         // Get.to(() => PurchaseProduct(product: product));
                         // _launchWhatsApp();
                          openWhatsapp(context,product,"237656451666",_prefs);
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

// Fonction pour lancer WhatsApp
void _launchWhatsApp() async {
  // Numéro de téléphone au format international
  String phoneNumber = "237691853983";

  // Message facultatif à envoyer avec le lien WhatsApp
  String message = "Bonjour depuis Flutter!";

  // Construire l'URL WhatsApp
  String url = "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
  Uri whatsapp = Uri.parse(url);


  // Vérifier si l'URL est valide avant de lancer
  if (await canLaunchUrl(whatsapp)) {
    await launchUrl(whatsapp);
  } else {
    // Gérer le cas où l'URL ne peut pas être lancée
    print("Impossible de lancer WhatsApp");
  }
}

void openWhatsapp(
     BuildContext context,
       Product prod,
       String number,final Future<SharedPreferences> prefs0) async {
  final prefs = await prefs0;
  final User user;
  var userString = await prefs.getString('user');
  var userJson = jsonDecode(userString!);
  user = User.fromJson(userJson);

  String text = "Cher équipe commerciale de MYSKUL,\n\n"
     + "Je sollicite faire un achat sur votre plate-forme MYSKUL SHOP. \n"
      +"- Nom du produit : "+prod.name.toString()
  +"\n- Prix : "+prod.price.toString()
  +"\n- Description : "+prod.description.toString()

  +"\nJe sollicite un retour de votre part pour finaliser la procédure d’achat."
  +"\n\nCordialement, "+user.name.toString();


  var whatsapp = number; //+92xx enter like this
  var whatsappURlAndroid =
      "whatsapp://send?phone=" + whatsapp + "&text=$text";
  var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
      await launchUrl(Uri.parse(
        whatsappURLIos,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  } else {
    // android , web
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  }
}
