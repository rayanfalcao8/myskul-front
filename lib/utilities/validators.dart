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
