import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:hypnosis/state_container.dart";
import "package:hypnosis/models/user.dart";

class ChatScreen extends StatefulWidget {
  final Widget child;
  String uid;

  ChatScreen({Key key, this.child, this.uid}) : super(key: key);

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textEditingController = TextEditingController();

  sendMessage(message) {
    Firestore.instance
        .collection('user-chat')
        .document(widget.uid)
        .collection("messages")
        .add({
      "created_at": DateTime.now(),
      "message": message,
      "sender": widget.uid
    });
    Firestore.instance
        .collection('user-chat')
        .document(widget.uid)
        .updateData({
          'last-message': message,
          "created_at": DateTime.now()
          });
    _textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    User user = container.user;

    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('user-chat')
                  .document(widget.uid)
                  .collection("messages")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return new Text("Error: ${snapshot.error}");
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text("Loading...");
                  default:
                    return new ListView(
                      padding: EdgeInsets.only(bottom: 50.0),
                      shrinkWrap: true,
                      
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new ListTile(
                            leading: (document['sender'] != user.uid)
                                ? CircleAvatar(
                                    child: Text('DR'),
                                    backgroundColor: Colors.grey[300],
                                  )
                                : null,
                            title: new Text(document["message"],
                                textAlign: document['sender'] == user.uid
                                    ? TextAlign.right
                                    : TextAlign.left),
                            trailing: (document['sender'] == user.uid)
                                ? CircleAvatar(
                                    child: Text('ME'),
                                    backgroundColor: Colors.green)
                                : null);
                      }).toList(),
                    );
                }
              },
            ),
            Align(
              heightFactor: 20.0,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration.collapsed(
                                  hintText: "Send a message"),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                if (_textEditingController.text != "") {
                                  sendMessage(_textEditingController.text);
                                }
                              },
                            ),
                          )
                        ],
                      )),
                )),
          ],
        ));
  }
}
