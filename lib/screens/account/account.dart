import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/components/gender_box.dart';
import 'package:myskul/components/input_number.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/controllers/home_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/account/account_password.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  User user = User();
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var noms = TextEditingController();

  var email = TextEditingController();

  var num = TextEditingController();

  var ville = TextEditingController();

  var datenaiss = TextEditingController();

  var selectedGender;

  var token;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getToken() async {
    final SharedPreferences prefs = await _prefs;
    token = await prefs.getString('token');
  }

  void init() async{
    widget.user = await HomeController().currentUser();
    noms.text = widget.user.name;
    email.text = widget.user.email;
    num.text = widget.user.phoneNumber ?? "";
    datenaiss.text = widget.user.birthdate ?? "";
    ville.text = widget.user.town ?? "";
    selectedGender = widget.user.gender == "Male" ? 0 : 1;
  }

  @override
  void initState() {
    // TODO: implement initState

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: HomeController().currentUser(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  decoration: BoxDecoration(
                      color: couleurs.white.withOpacity(0.5),
                      image: DecorationImage(
                          image: AssetImage("assets/images/math.png"),
                          opacity: 0.04,
                          fit: BoxFit.cover)),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: couleurs.green,
                  )),
                );
              } else {
                widget.user = snapshot.data!;
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        color: couleurs.white.withOpacity(0.5),
                        image: DecorationImage(
                            image: AssetImage("assets/images/math.png"),
                            opacity: 0.04,
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height / 2.4,
                              minHeight:
                                  MediaQuery.of(context).size.height / 3),
                          decoration: BoxDecoration(
                              gradient: gradients.greenGradient,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 20,
                                  )),
                              Positioned(
                                  top: 50,
                                  right: 40,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 08,
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height / 5,
                                  right: 40,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 15,
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height / 5,
                                  left: 40,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 25,
                                  )),
                              Positioned(
                                  top: 0,
                                  left: MediaQuery.of(context).size.width / 1.5,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 28,
                                  )),
                              Positioned(
                                  top: 40,
                                  left: 40,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        couleurs.white.withOpacity(0.05),
                                    radius: 08,
                                  )),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(
                                              icones.back2,
                                              color: couleurs.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => AccountPassword(
                                                      user: widget.user),
                                                  transition: Transition
                                                      .circularReveal);
                                            },
                                            child: Icon(
                                              icones.lock,
                                              color: couleurs.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "my-account".tr,
                                    style: textes.h2l
                                        .copyWith(color: couleurs.white),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                        'assets/images/loading1.gif'),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          widget.user.profile_image),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.6,
                                        minWidth:
                                            MediaQuery.of(context).size.width /
                                                4),
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.user.name,
                                          style: textes.h2l
                                              .copyWith(color: couleurs.white),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            child: AnimationLimiter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 500),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    NewInput(
                                        controller: noms,
                                        onSubmit: (g) {},
                                        keyboardType: TextInputType.text,
                                        hintText: "firstname-lastname",
                                        prefixIcon: Icon(icones.user)),
                                    NewInput(
                                        controller: email,
                                        onSubmit: (g) {},
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintText: "email",
                                        prefixIcon: Icon(icones.user)),
                                    NewInputInter(
                                        controller: num,
                                        onSubmit: (g) {},
                                        keyboardType: TextInputType.phone,
                                        hintText: "phone",
                                        prefixIcon: Icon(icones.user)),
                                    NewInput(
                                        controller: ville,
                                        onSubmit: (g) {},
                                        keyboardType: TextInputType.text,
                                        hintText: "city",
                                        prefixIcon: Icon(icones.city)),
                                    NewInput(
                                        controller: datenaiss,
                                        readOnly: true,
                                        onSubmit: (g) {},
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            ColorScheme.light(
                                                          primary: couleurs
                                                              .green, // header background color
                                                          onPrimary: couleurs
                                                              .white, // header text color
                                                          onSurface: couleurs
                                                              .black, // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            foregroundColor:
                                                                couleurs
                                                                    .black, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate: DateTime
                                                      .now(), //get today's date
                                                  firstDate: DateTime(
                                                      1900), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd').format(
                                                    pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2022-07-04
                                            //You can format date as per your need

                                            datenaiss.text = formattedDate;
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                        keyboardType: TextInputType.datetime,
                                        hintText: "bd",
                                        prefixIcon: Icon(icones.calendar)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Bounceable(
                                          onTap: () {
                                            setState(() {
                                              selectedGender = 0;
                                              print(selectedGender);
                                            });
                                          },
                                          child: GenderBox(
                                            selectedGender: selectedGender,
                                            icones: icones.boy,
                                            condition: 0,
                                            gender: "male",
                                            width: 145,
                                            height: 80,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Bounceable(
                                          onTap: () {
                                            setState(() {
                                              selectedGender = 1;
                                              print(selectedGender);
                                            });
                                          },
                                          child: GenderBox(
                                            selectedGender: selectedGender,
                                            icones: icones.girl,
                                            condition: 1,
                                            gender: "female",
                                            width: 145,
                                            height: 80,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    NewButtonG(
                                      text: "save",
                                      function: () async {
                                        if (noms.text.isEmpty) {
                                          EasyLoading.showError("Nom Requis");
                                        } else if (email.text.isEmpty) {
                                          EasyLoading.showError(
                                              "Mot de passe Requis");
                                        } else if (num.text.isEmpty) {
                                          EasyLoading.showError(
                                              "Numéro Requis");
                                        } else if (ville.text.isEmpty) {
                                          EasyLoading.showError("Ville Requis");
                                        } else if (datenaiss.text.isEmpty) {
                                          EasyLoading.showError(
                                              "Date de naissance Requis");
                                        } else {
                                          await getToken();
                                          RegisterationController().updateUser(
                                              idController:
                                                  widget.user.id.toString(),
                                              userController: noms.text,
                                              numController: num.text,
                                              emailController: email.text,
                                              cityController: ville.text,
                                              bdController: datenaiss.text,
                                              genderController: selectedGender,
                                              token: token);
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
