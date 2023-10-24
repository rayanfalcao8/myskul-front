class Notification {
  var id;
  var titre;
  var type;
  var contenu;
  var image;
  var isRead;
  var dateDeCreation;

  Notification({
    id,
    titre,
    type,
    contenu,
    image,
    isRead,
    dateDeCreation,
  });

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    type = json['type'];
    contenu = json['content'];
    image = json['image'];
    isRead = json['isRead'];
    dateDeCreation = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'type': type,
      'contenu': contenu,
    };
  }
}
