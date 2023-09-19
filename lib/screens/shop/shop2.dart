
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF22987F),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.larousse.fr%2Fencyclopedie%2Fpays%2FCameroun%2F110992&psig=AOvVaw2VWMjlxTUA3OuTSRs2m71f&ust=1694603311336000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMiHvbX3pIEDFQAAAAAdAAAAABAE',
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.topLeft,
              heightFactor: .6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
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

                child: Column(

                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "NOM DU PRODUIT",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
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
                          "1000FCA",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.48),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper lacinia nunc sagittis posuere. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin cursus non nunc at tempor",
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper lacinia nunc sagittis posuere. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin cursus non nunc at tempor",
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    TextButton(
                      onPressed: () {},
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
