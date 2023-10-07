import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myskul/components/form_inputs.dart';
import 'package:myskul/controllers/domain_controller.dart';
import 'package:myskul/controllers/level_controller.dart';
import 'package:myskul/controllers/speciality_controller.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/speciality.dart';
import 'package:myskul/models/sub-type.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:myskul/utilities/validators.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  int? _typeId;
  int? _domainId;
  int? _levelId;
  int? _specialityId;
  int? _pType = 1;
  List<Domain> _domains = [];
  List<Level> _levels = [];
  List<Speciality> _specialities = [];
  List<SubscriptionType> _subTypes = [];
  int _currentStep = 0;
  List<int> _paymentTypes = [1, 2];
  // List<int> _paymentTypes = [];
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  _loadData() async {
    List resp = await Future.wait([
      DomainController.getAll(),
      LevelController.getAll(),
      SpecialityController.getAll(),
      SubscriptionController.getSubTypes(),
      // PaymentController.getPaymentMethods(),
    ]);
    _domains = resp[0];
    _levels = resp[1];
    _specialities = resp[2];
    _subTypes = resp[3];
    setState(() {});
    // _paymentTypes = resp[4];
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
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.showSuccess(
                          "Souscription effectuée avec succès !");
                    } else {
                      EasyLoading.showInfo("Veuillez remplir tous les champs");
                    }
                  } else {
                    _currentStep += 1;
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
            content: Column(
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
                    items: _getTypesItems(_subTypes),
                    validator: dropDownValidator,
                    onChanged: (value) {
                      _typeId = value;
                    }),
                SizedBox(height: 20),
                LabelText(label: "Domaine"),
                DropdownMenuInput(
                    // hintText: "Domaine",
                    items: _getDomainItems(_domains),
                    validator: dropDownValidator,
                    onChanged: (value) {
                      _domainId = value;
                    }),
                SizedBox(height: 20),
                LabelText(label: "Niveau"),
                DropdownMenuInput(
                    // hintText: "Niveau",
                    items: _getLevelItems(_levels),
                    validator: dropDownValidator,
                    onChanged: (value) {
                      _levelId = value;
                    }),
                SizedBox(height: 20),
                LabelText(label: "Spécialité"),
                DropdownMenuInput(
                    // hintText: "Spécialité",
                    items: _getSpecItems(_specialities),
                    validator: dropDownValidator,
                    onChanged: (value) {
                      _specialityId = value;
                    }),
              ],
            )),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          title: Text("Paiement"),
          isActive: _currentStep >= 1,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(label: "Type"),
              DropdownMenuInput(
                  // hintText: "Type",
                  items: _getPaymentTypes(_paymentTypes),
                  defaultValue: _pType,
                  validator: numValidator,
                  onChanged: (value) {
                    setState(() {
                      _pType = value;
                    });
                  }),
              SizedBox(height: 30),
              if (_pType == 1)
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
                      validator: stringValidator,
                      textInputType: TextInputType.number,
                    ),
                  ]),
                ),
              if (_pType == 2)
                Container(
                  child: Text("Fill info for type 2"),
                )
            ],
          ),
        )
      ];
}
