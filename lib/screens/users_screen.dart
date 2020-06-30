import 'package:chat_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  final User currentUser;
  UsersScreen({this.currentUser});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users Screen'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_comment),
              onPressed: () {},
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    if (widget.currentUser.email != document['email']) {
                      return Card(
                        child: ListTile(
                          title: Text(document['name']),
                          subtitle: Text(document['email']),
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
