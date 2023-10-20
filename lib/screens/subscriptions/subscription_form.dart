import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myskul/components/form_inputs.dart';
import 'package:myskul/controllers/domain_controller.dart';
import 'package:myskul/controllers/level_controller.dart';
import 'package:myskul/controllers/payment_controller.dart';
import 'package:myskul/controllers/speciality_controller.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/payment.dart';
import 'package:myskul/models/speciality.dart';
import 'package:myskul/models/sub-type.dart';
import 'package:myskul/models/subscription.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/validators.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  int? _typeId;
  int? _domainId;
  int? _levelId;
  int? _specialityId;
  String? _pMethod;
  List<Domain> _domains = [];
  List<Level> _levels = [];
  List<Speciality> _specialities = [];
  List<SubscriptionType> _subTypes = [];
  int _currentStep = 0;
  List<PaymentMethod> _paymentMethods = [];
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  _loadData() async {
    List resp = await Future.wait([
      DomainController.getAll(),
      LevelController.getAll(),
      SpecialityController.getAll(),
      SubscriptionController.getSubTypes(),
      PaymentController.getPaymentMethods(),
    ]);
    _domains = resp[0];
    _levels = resp[1];
    _specialities = resp[2];
    _subTypes = resp[3];
    _paymentMethods = resp[4];
    if (mounted) setState(() {});
  }

  void initForms() {
    _typeId = null;
    _domainId = null;
    _levelId = null;
    _specialityId = null;
    _pMethod = null;
    _phoneController.clear();
    _amountController.clear();
  }

  List<DropdownMenuItem<String>> _getPaymentMethods(
      List<PaymentMethod> methods) {
    List<DropdownMenuItem<String>> items = [];
    for (var t in methods) {
      items.add(DropdownMenuItem(
        child: Text("${t.merchant}"),
        value: t.payItemId,
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getTypesItems(List<SubscriptionType> types) {
    List<DropdownMenuItem<int>> items = [];
    for (var t in types) {
      items.add(DropdownMenuItem(
        child: Text(t.category!),
        value: t.id!,
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getDomainItems(List<Domain> domains) {
    List<DropdownMenuItem<int>> items = [];
    for (var d in domains) {
      items.add(DropdownMenuItem(
        child: Text(d.displayName!),
        value: d.id!,
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getLevelItems(List<Level> levels) {
    List<DropdownMenuItem<int>> items = [];
    for (var l in levels) {
      items.add(DropdownMenuItem(
        child: Text(l.id.toString()!),
        value: l.id!,
      ));
    }
    return items;
  }

  String _getRegex() {
    for (var element in _paymentMethods) {
      if (element.payItemId == _pMethod) {
        return element.regex!;
      }
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final isLastStep = (_currentStep == _getSteps().length - 1);

    return Scaffold(
      appBar: getAppBar(title: "Ajouter Abonnement", context: context),
      body: Container(
        decoration: getBckDecoration(),
        padding: EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
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
                  if (_formKey2.currentState!.validate()) {
                    Subscription sub = Subscription(
                        type: _typeId.toString(),
                        levelId: _levelId.toString(),
                        specialityId: _specialityId.toString(),
                        domainId: _domainId.toString(),
                        amount: _amountController.text,
                        serviceId: _pMethod,
                        buyerPhoneNumber: _phoneController.text);

                    print(sub.toJson());
                    SubscriptionController.create(sub).then((value) {
                      if (value) {
                        EasyLoading.showSuccess(
                            "Souscription initiée avec succès, veuillez confirmer le paiement !", duration: Duration(seconds: 5), dismissOnTap: true );
                        setState(() {
                          initForms();
                          _currentStep -= 1;
                        });
                        Get.back();
                      }
                    });
                  } else {
                    EasyLoading.showInfo("Veuillez valider tous les champs");
                  }
                } else {
                  if (_formKey1.currentState!.validate()) {
                    _currentStep += 1;
                  }
                }
              });
            },
            onStepCancel: _currentStep == 0
                ? null
                : () {
                    setState(() {
                      _currentStep -= 1;
                    });
                  },
          ),
        ),
      ),
    );
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
            content: Form(
              key: _formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  LabelText(label: "Type"),
                  DropdownMenuInput(
                      // hintText: "Type",
                      defaultValue: _typeId,
                      items: _getTypesItems(_subTypes),
                      validator: dropDownValidator,
                      onChanged: (value) {
                        _typeId = value;
                      }),
                  SizedBox(height: 20),
                  LabelText(label: "Domaine"),
                  DropdownMenuInput(
                      // hintText: "Domaine",
                      defaultValue: _domainId,
                      items: _getDomainItems(_domains),
                      validator: dropDownValidator,
                      onChanged: (value) {
                        _domainId = value;
                      }),
                  SizedBox(height: 20),
                  LabelText(label: "Niveau"),
                  DropdownMenuInput(
                      // hintText: "Niveau",
                      defaultValue: _levelId,
                      items: _getLevelItems(_levels),
                      validator: dropDownValidator,
                      onChanged: (value) {
                        _levelId = value;
                      }),
                  SizedBox(height: 20),
                  LabelText(label: "Spécialité"),
                  DropdownMenuInput(
                      // hintText: "Spécialité",
                      defaultValue: _specialityId,
                      items: _getSpecItems(_specialities),
                      validator: dropDownValidator,
                      onChanged: (value) {
                        _specialityId = value;
                      }),
                ],
              ),
            )),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text("Paiement"),
          isActive: _currentStep >= 1,
          content: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(label: "Type"),
                DropdownMenuInputStr(
                    // hintText: "Type",
                    items: _getPaymentMethods(_paymentMethods),
                    defaultValue: _pMethod,
                    validator: stringValidator,
                    onChanged: (value) {
                      setState(() {
                        _pMethod = value;
                      });
                    }),
                SizedBox(height: 20),
                // if (_pMethod == "")
                Container(
                  height: 200,
                  child: ListView(children: [
                    LabelText(label: "Montant"),
                    TextFieldInput(
                      controller: _amountController,
                      validator: stringValidator,
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    LabelText(label: "Numéro téléphone"),
                    TextFieldInput(
                      controller: _phoneController,
                      validator: (value) =>
                          phoneNumValidator(value, _getRegex()),
                      textInputType: TextInputType.number,
                    ),
                  ]),
                ),
                // if (_pType == 2)
                //   Container(
                //     child: Text("Fill info for type 2"),
                //   )
              ],
            ),
          ),
        )
      ];
}
