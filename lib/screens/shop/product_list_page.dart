import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/product_controller.dart';
import 'package:myskul/models/product.dart';
import 'package:myskul/screens/shop/product_detail.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/helpers.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ColorHelper colors = ColorHelper();
  List<String> categories = [
    "Categorie A",
    "Categorie B",
    "Categorie C",
    "Categorie D",
  ];
  String selectedCat = "";
  List<Product> _products = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    selectedCat = categories[0];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _products = await ProductController.getAll();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Produits", context: context),
      body: Container(
        decoration: getBckDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
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
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(categories.length,
                      (index) => _buildCatBadge(categories[index])),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (!_products.isEmpty)
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(_products.length,
                        (index) => _buildProduct(_products[index])),
                  ),
                ),
              if (_products.isEmpty)
                Expanded(
                    child: Column(
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
                ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProduct(Product product) {
    return InkWell(
        onTap: () => Get.to(() => ProductDetail(product: product)),
        child: Card(
          color: _pickColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                CachedNetworkImage(
                  width: 85,
                  height: 85,
                  imageUrl: product.pictureURL!,
                  placeholder: (context, url) => Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.not_accessible),
                ),
                SizedBox(height: 8),
                Text(
                  "${product.name!}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(height: 5),
                Text(
                  "${product.price!} FCFA",
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildCatBadge(String category) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCat = category;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: selectedCat == category ? Colors.green.shade100 : null,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              category.toUpperCase(),
              style: TextStyle(
                color: selectedCat == category ? Color(0xff22987f) : null,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _pickColor() {
    Color color;
    switch (_index) {
      case 0:
        {
          color = Color.fromARGB(255, 103, 221, 174);
          break;
        }
      case 1:
        {
          color = Colors.lightGreen.shade400;
          break;
        }
      case 2:
        {
          color = Colors.pink.shade200;
          break;
        }
      case 3:
        {
          color = Colors.red.shade300;
          break;
        }
      case 4:
        {
          color = Colors.blue.shade300;
          break;
        }
      case 5:
        {
          color = Colors.brown.shade400;
          break;
        }
      case 6:
        {
          color = Colors.purple.shade400;
          break;
        }
      default:
        {
          color = Colors.green.shade400;
        }
    }
    _index += 1;
    if (_index > 6) {
      _index = 0;
    }
    return color;
  }
}
