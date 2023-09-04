class Category {
  var id;
  var name;
  var displayText;

  Category({id, displayText, name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'displayText': displayText,
    };
  }

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name= json['name'];
    displayText= json['displayText'];
  }
}
