import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/controllers/product_controller.dart';
import 'package:myskul/models/product.dart';
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
    "Categorie E"
  ];
  String selectedCat = "";
  List<Product> _products = [
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
    Product(
        name: "Good",
        price: "500",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut malesuada urna. Aenean a aliquet nunc, ut sollicitudin nibh. Aliquam erat volutpat. Aenean dapibus blandit aliquet. Nulla vulputate ipsum odio, sed rhoncus magna consectetur eget. Vivamus consequat faucibus diam, eu blandit magna pulvinar eget. Morbi sit amet mauris eu dui egestas pretium. In a nulla est. Mauris tempor dui ac fringilla eleifend. Ut vel vestibulum tortor, a vulputate odio. Aenean tristique, eros non pellentesque aliquam, sapien tortor sollicitudin lectus, vitae imperdiet sapien est ac orci. Curabitur eget aliquam ligula.",
        pictureURL:
            "https://secure.skypeassets.com/content/dam/scom/grd/web_skype_image_big_screens_optimized.png"),
  ];
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCat = categories[0];
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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  children: List.generate(_products.length,
                      (index) => _buildProduct(_products[index])),
                ),
              ),
            ],
          ),
        ),
      ),

      // Container(
      //   decoration: getBckDecoration(),
      //   child: Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: Column(
      //       children: [
      //         TextField(
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: colors.grey.withOpacity(0.1),
      //             prefixIcon: Icon(Icons.search, color: colors.black),
      //             hintText: "search".tr,
      //             hintStyle: const TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.w400,
      //             ),
      //             border: OutlineInputBorder(
      //               borderSide: BorderSide.none,
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Center(
      //           child: Text(
      //             "Liste des produits",
      //             style: TextStyle(
      //               fontSize: 13,
      //               fontWeight: FontWeight.w300,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         for (int i = 0; i < _products.length; i + 2)
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               _buildProduct(_products[i]),
      //               if (i + 1 < _products.length)
      //                 _buildProduct(_products[i + 1])
      //             ],
      //           )
      //       ],
      //     ),
      //   ),

      //   // FutureBuilder(
      //   //   future: ProductController.getAll(),
      //   //   builder: (context, snapshot) {
      //   //     if (snapshot.connectionState == ConnectionState.waiting) {
      //   //       return Center(child: CircularProgressIndicator());
      //   //     } else if (snapshot.hasData) {
      //   //       List<Product>? products = snapshot.data;
      //   //       print("${products}");
      //   //       if (products != null && products.isNotEmpty) {
      //   //         return Padding(
      //   //           padding: const EdgeInsets.all(10),
      //   //           child: Column(
      //   //             children: [
      //   //               TextField(
      //   //                 decoration: InputDecoration(
      //   //                   filled: true,
      //   //                   fillColor: colors.grey.withOpacity(0.1),
      //   //                   prefixIcon: Icon(Icons.search, color: colors.black),
      //   //                   hintText: "search".tr,
      //   //                   hintStyle: const TextStyle(
      //   //                     fontSize: 14,
      //   //                     fontWeight: FontWeight.w400,
      //   //                   ),
      //   //                   border: OutlineInputBorder(
      //   //                     borderSide: BorderSide.none,
      //   //                     borderRadius: BorderRadius.circular(10),
      //   //                   ),
      //   //                 ),
      //   //               ),
      //   //               const SizedBox(
      //   //                 height: 20,
      //   //               ),
      //   //               Center(
      //   //                 child: Text(
      //   //                   "Liste des produits",
      //   //                   style: TextStyle(
      //   //                     fontSize: 13,
      //   //                     fontWeight: FontWeight.w300,
      //   //                   ),
      //   //                 ),
      //   //               ),
      //   //               const SizedBox(
      //   //                 height: 20,
      //   //               ),
      //   //               for (int i = 0; i < products.length; i + 2)
      //   //                 Row(
      //   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   //                   children: [
      //   //                     _buildProduct(products[i]),
      //   //                     if (i + 1 < products.length)
      //   //                       _buildProduct(products[i + 1])
      //   //                   ],
      //   //                 )
      //   //             ],
      //   //           ),
      //   //         );
      //   //       }
      //   //     }
      //   //     return Column(
      //   //       mainAxisAlignment: MainAxisAlignment.center,
      //   //       children: [
      //   //         SizedBox(height: 300.0),
      //   //         Icon(
      //   //           Icons.warning,
      //   //           size: 64.0,
      //   //           color: Colors.grey,
      //   //         ),
      //   //         SizedBox(height: 15.0),
      //   //         Text("Vous n'avez aucun produit"),
      //   //       ],
      //   //     );
      //   //   },
      //   // ),
      // )
    );
  }

  Widget _buildProduct(Product product) {
    return InkWell(
        // onTap: () => Get.to(() => ),
        child: Card(
      // decoration: BoxDecoration(
      //     color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            CachedNetworkImage(
              width: 70,
              height: 70,
              imageUrl: product.pictureURL!,
              placeholder: (context, url) => Container(
                  width: 50, height: 50, child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.not_accessible),
            ),
            SizedBox(height: 8),
            Text(
              "${product.name!}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "${product.price!}",
              style: TextStyle(color: Colors.grey),
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

  // Color _pickColor() {
  //   Color color;
  //   switch (_index) {
  //     case 0:
  //       {
  //         color = Colors.green;
  //         break;
  //       }
  //     case 1:
  //       {
  //         color = Colors.lightGreen;
  //         break;
  //       }
  //     case 2:
  //       {
  //         color = Colors.pink.shade200;
  //         break;
  //       }
  //     case 3:
  //       {
  //         color = Colors.red.shade300;
  //         break;
  //       }
  //     case 4:
  //       {
  //         color = Colors.blue;
  //         break;
  //       }
  //     case 5:
  //       {
  //         color = Colors.brown;
  //         break;
  //       }
  //     case 6:
  //       {
  //         color = Colors.purple;
  //         break;
  //       }
  //     default:
  //       {
  //         color = Colors.green;
  //       }
  //   }
  //   _index += 1;
  //   if (_index > 6) {
  //     _index = 0;
  //   }
  //   return color;
  // }
}
