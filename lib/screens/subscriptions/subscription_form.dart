import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/form_inputs.dart';
import 'package:myskul/components/input.dart';
import 'package:myskul/controllers/domain_controller.dart';
import 'package:myskul/controllers/level_controller.dart';
import 'package:myskul/controllers/speciality_controller.dart';
import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/speciality.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/texts.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  int? _domainId;
  final _typeController = TextEditingController();
  final _levelIdController = TextEditingController();
  final _specialityIdController = TextEditingController();
  List<Domain> _domains = [];
  List<Level> _levels = [];
  List<Speciality> _specialities = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   _domains = await DomainController.getAll();
    //   _levels = await LevelController.getAll();
    //   _specialities = await SpecialityController.getAll();
    //   print("Length: ${_domains.length}");
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _typeController.dispose();
    _levelIdController.dispose();
    _specialityIdController.dispose();
    super.dispose();
  }

  _loadData() async {
    List resp = await Future.wait([
      DomainController.getAll(),
      LevelController.getAll(),
      SpecialityController.getAll()
    ]);
    _domains = resp[0];
    _levels = resp[1];
    _specialities = resp[2];
    return true;
  }

  List<DropdownMenuItem<int>> _getDomainItems(List<Domain> domains) {
    List<DropdownMenuItem<int>> items = [];
    for (var d in domains) {
      items.add(DropdownMenuItem(
        child: Text(d.name!),
        value: d.id!,
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getLevelItems(List<Level> levels) {
    List<DropdownMenuItem<int>> items = [];
    for (var l in levels) {
      items.add(DropdownMenuItem(
        child: Text(l.level!),
        value: l.id!,
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getSpecItems(List<Speciality> specs) {
    List<DropdownMenuItem<int>> items = [];
    for (var s in specs) {
      items.add(DropdownMenuItem(
        child: Text(s.speciality!),
        value: s.id!,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Ajouter Abonnement"),
      body: Container(
        decoration: getDecoration(),
        padding: EdgeInsets.only(top: 50),
        child: FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Form(
                key: _formKey,
                child: ListView(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Veuillez renseigner les informations d'abonnement",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  NewInput(
                    controller: _typeController,
                    onSubmit: (g) {},
                    hintText: "Type",
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 51,
                      child: DropdownMenuInput(
                          hintText: "Domaine",
                          items: _getDomainItems(_domains),
                          onChanged: (value) {
                            _domainId = value;
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 51,
                      child: DropdownMenuInput(
                          hintText: "Niveau",
                          items: _getLevelItems(_levels),
                          onChanged: (value) {
                            _domainId = value;
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 51,
                      child: DropdownMenuInput(
                          hintText: "Spécialité",
                          items: _getSpecItems(_specialities),
                          onChanged: (value) {
                            _domainId = value;
                          }),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: NewButtonG(
                      text: "Souscrire",
                      function: () {
                        EasyLoading.showSuccess("Souscription effectuée !");
                      },
                    ),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}
