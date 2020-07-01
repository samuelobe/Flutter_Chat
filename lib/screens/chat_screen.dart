import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String email;

  ChatScreen({this.name, this.email});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Firestore firestore = Firestore.instance;
  final ScrollController _scrollController = ScrollController();
  TextEditingController _messageController = TextEditingController();
  String message = "";

  Future<void> onSend() async {
    if (_messageController.text.length > 0) {
      await firestore
          .collection('messages')
          .document(DateTime.now().toString())
          .setData({"message": _messageController.text, "email": widget.email});

      _messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Chat Screen"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return null;
                  },
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection('messages').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
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
                            controller: _scrollController,
                            shrinkWrap: true,
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return Align(
                                alignment: document['email'] == widget.email
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Card(
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(document['message']),
                                    )),
                              );
                            }).toList(),
                          );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelText: "Send message",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        var output;
                        if (input.isEmpty) {
                          output = "Please type a username";
                        }
                        return output;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      onFieldSubmitted: (value) => onSend(),
                    ),
                    IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.send),
                        onPressed: onSend),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
