import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:hypnosis/ui/chat-screen.dart';

class ChatList extends StatefulWidget {
  final Widget child;

  ChatList({Key key, this.child}) : super(key: key);

  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat List"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('user-chat')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircleAvatar(),
                );
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: Text(document["email"]),
                      subtitle: Text((document["last-message"] != null)
                          ? document["last-message"]
                          : "Empty conversation"),
                     
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) => ChatScreen(
                                      uid: document.documentID,
                                    )));
                      },
                    );
                  }).toList(),
                );
            }
          },
        ));
  }
}
