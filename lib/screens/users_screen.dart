import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({Key key}) : super(key: key);

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
    );
  }
}
