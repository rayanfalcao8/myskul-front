import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController {
  // reference for our collections
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groupes");

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': 'John Doe', // John Doe
          'company': 'Stokes and Sons', // Stokes and Sons
          'age': '42' // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
