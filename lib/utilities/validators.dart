String? stringValidator(String? value) {
  if (value == null || value.isEmpty || value == "") {
    return "Veuillez entrer une valeur";
  }
  return null;
}

String? numValidator(int? value) {
  if (value == null) {
    return "Veuillez entrer une valeur";
  }
  return null;
}

String? dropDownValidator(int? value) {
  if (value == null) {
    return "Veuillez sélectionner une valeur";
  }
  return null;
}

String? phoneNumValidator(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty || phoneNumber == "") {
    return "Veuillez entrer une valeur";
  }
  RegExp mtnRegexp = new RegExp(
    r"/^6(((7|8)[0-9]{7}$)|(5[0-4][0-9]{6}$))/",
    caseSensitive: false,
    multiLine: false,
  );
  RegExp orangeRegexp = new RegExp(
    r"/^6(((9)[0-9]{7}$)|(5[5-9][0-9]{6}$))/",
    caseSensitive: false,
    multiLine: false,
  );
  if (!(mtnRegexp.hasMatch(phoneNumber) || orangeRegexp.hasMatch(phoneNumber)))
    return "Numéro de téléphone invalide";
  return null;
}
