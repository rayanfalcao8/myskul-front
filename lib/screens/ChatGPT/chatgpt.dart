import 'package:flutter/material.dart';
// import 'package:google_bard/google_bard.dart';

import '../../utilities/colors.dart';
import '../../utilities/gradients.dart';
import '../../utilities/helpers.dart';
import '../../utilities/icons.dart';
import '../../utilities/texts.dart';

class ChatGPT extends StatelessWidget {

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var messageController = TextEditingController();

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "My AI", context: context),
      body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: couleurs.green,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(20))),
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                      controller: messageController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: couleurs.white,
                    )),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: couleurs.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ),
                )
              ]),
            ),
          ),
    );
  }
}
