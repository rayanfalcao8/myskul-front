class Notification {
  var id;
  var titre;
  var type;
  var contenu;
  var image;
  var isRead;
  var dateDeCreation;

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    type = json['type'];
    contenu = json['contenu'];
    image = json['image'];
    isRead = json['isRead'];
    dateDeCreation = json['dateDeCreation'];
  }
}
