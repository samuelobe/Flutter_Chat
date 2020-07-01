import 'package:chat_app/model/user.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  final User currentUser;
  UsersScreen({this.currentUser});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final Firestore firestore = Firestore.instance;
  final Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Chats'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                );
              default:
                return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    if (widget.currentUser.email != document['email']) {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            size: 40,
                          ),
                          title: Text("${document['firstName']} ${document['lastName']}"),
                          subtitle: Text(document['email']),
                          onTap: () async {
                            var uuid = await db.createChat(
                                widget.currentUser.email, document['email']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    name: document['firstName'],
                                    email: document['email'],
                                    currentEmail: widget.currentUser.email,
                                    uuid: uuid,
                                  ),
                                ));
                          },
                        ),
                      );
                    }
                    return Container();
                  }).toList(),
                );
            }
          },
        ));
  }
}
