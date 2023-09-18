import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/form_inputs.dart';
import 'package:myskul/components/input.dart';
import 'package:myskul/controllers/domain_controller.dart';
import 'package:myskul/controllers/level_controller.dart';
import 'package:myskul/controllers/speciality_controller.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/speciality.dart';
import 'package:myskul/models/subscription.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/validators.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  int? _domainId;
  int? _levelId;
  int? _specialityId;
  int? _pType;
  List<Domain> _domains = [];
  List<Level> _levels = [];
  List<Speciality> _specialities = [];
  int _currentStep = 0;
  List<int> _paymentTypes = [1, 2];

  @override
  void dispose() {
    _typeController.dispose();
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

  List<DropdownMenuItem<int>> _getPaymentTypes(List<int> types) {
    List<DropdownMenuItem<int>> items = [];
    for (var t in types) {
      items.add(DropdownMenuItem(
        child: Text("Type $t"),
        value: t,
      ));
    }
    return items;
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

  List<Step> _getSteps() => [
        Step(
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            title: Text("Abonnement"),
            isActive: _currentStep >= 0,
            content: Column(children: [
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
              TextFieldInput(
                controller: _typeController,
                validator: stringValidator,
                labelText: "Type",
                hintText: "Type",
              ),
              SizedBox(height: 20),
              DropdownMenuInput(
                  hintText: "Domaine",
                  items: _getDomainItems(_domains),
                  validator: dropDownValidator,
                  onChanged: (value) {
                    _domainId = value;
                  }),
              SizedBox(height: 20),
              DropdownMenuInput(
                  hintText: "Niveau",
                  items: _getLevelItems(_levels),
                  validator: dropDownValidator,
                  onChanged: (value) {
                    _levelId = value;
                  }),
              SizedBox(height: 20),
              DropdownMenuInput(
                  hintText: "Spécialité",
                  items: _getSpecItems(_specialities),
                  validator: dropDownValidator,
                  onChanged: (value) {
                    _specialityId = value;
                  }),
            ])),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text("Paiement"),
          isActive: _currentStep >= 1,
          content: Column(
            children: [
              DropdownMenuInput(
                  hintText: "Type",
                  items: _getPaymentTypes(_paymentTypes),
                  // validator: dropDownValidator,
                  defaultValue: _pType,
                  onChanged: (value) {
                    setState(() {
                      _pType = value;
                    });
                  }),
              SizedBox(height: 30),
              if (_pType == 1)
                Container(
                  child: Text("Fill info for type 1"),
                ),
              if (_pType == 2)
                Container(
                  child: Text("Fill info for type 1"),
                )
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Ajouter Abonnement", context: context),
      body: Container(
        decoration: getBckDecoration(),
        padding: EdgeInsets.only(top: 20),
        child: FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              final isLastStep = (_currentStep == _getSteps().length - 1);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Form(
                  key: _formKey,
                  child: Stepper(
                    type: StepperType.horizontal,
                    steps: _getSteps(),
                    currentStep: _currentStep,
                    controlsBuilder: (context, details) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonInput(
                                onPressed: details.onStepCancel,
                                putIconLeft: true,
                                text: "Précédent"),
                            SizedBox(width: 15),
                            ButtonInput(
                                onPressed: details.onStepContinue,
                                putIconLeft: false,
                                text: isLastStep ? "Souscrire" : "Suivant"),
                          ],
                        ),
                      );
                    },
                    onStepContinue: () {
                      setState(() {
                        if (isLastStep) {
                          print("Bingo");
                        } else {
                          _currentStep += 1;
                          print("Continue");
                        }
                      });
                    },
                    onStepCancel: _currentStep == 0
                        ? null
                        : () {
                            setState(() {
                              _currentStep -= 1;
                              print("Cancel");
                            });
                          },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
