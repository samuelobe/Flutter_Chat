import 'package:chat_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final Firestore firestore = Firestore.instance;

  void setUserData(User user) {
    var userData = user.getMap();
    firestore
        .collection('users')
        .document(user.email)
        .setData(userData, merge: true)
        .then((_) {
      print("User ${user.email} logged in!");
    });
  }
}
