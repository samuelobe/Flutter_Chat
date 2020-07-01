import 'package:chat_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

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

  Future<String> createChat(String email1, String email2) async {
    var collection = firestore.collection('users');
    final snapshot = await collection
        .document(email1)
        .collection("chats")
        .document(email2)
        .get();
    var idV1;

    if (snapshot.exists) {
      print('Exists');
      idV1 = snapshot.data['chatUUID'];
      print(idV1);
    } else {
      var uuid = Uuid();
      idV1 = uuid.v1();

      collection
          .document(email1)
          .collection("chats")
          .document(email2)
          .setData({"chatUUID": idV1}, merge: true);
      collection
          .document(email2)
          .collection("chats")
          .document(email1)
          .setData({"chatUUID": idV1}, merge: true);
      print("Chat does not exist yet... Creating UUID");
    }

    return idV1;
  }
}
