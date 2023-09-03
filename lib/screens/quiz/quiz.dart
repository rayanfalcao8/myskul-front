import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            leading: BackButton(),
            backgroundColor: Color(0xff22987f),
            expandedHeight: 80,
            title: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text("Quiz"),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x3abec4c3),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "ENTREZ UN MOT CLE",
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Faites des quiz et apprenez plus rapidement !",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0x72000000),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xfff5bd50),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0x9bbfda15),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0x7feb45d1),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xa529efc4),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 81,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff5cabf5),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.28),
                                radius: 32,
                                child: const Icon(
                                  Icons.toc_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: const Text(
                                "NOM CATEGORIE",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
