import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypnosis/widets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:hypnosis/state_container.dart";
import "package:hypnosis/models/user.dart";
import 'package:intl/intl.dart';

class rdvlistView extends StatefulWidget {
  final Widget child;

  rdvlistView({Key key, this.child}) : super(key: key);

  rdvListState createState() => rdvListState();
}


class rdvListState extends State<rdvlistView>{


  @override
  Widget build(BuildContext context) {

    final container = StateContainer.of(context);
    User user = container.user;
    var formatter = new DateFormat('yyyy-MM-dd');

    String giveMonth(int mois){
      String month = "";

      if(mois == 1){
        month = "janvier";
        return  month;
      }

      if(mois == 2){
        month = "février";
        return  month;
      }

      if(mois == 3){
        month = "mars";
        return  month;
      }
      if(mois == 4){
        month = "avril";
        return  month;
      }

      return "other";
    }


    return new MaterialApp(

      title: 'List of rdv',
      home: Scaffold(

        body: SingleChildScrollView(

        scrollDirection: Axis.vertical,
        child: new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(15.0)),

          new Text(
            'Liste des séances du : Patient X',
            style: new TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('user-agenda')
                    .document(user.uid)
                    .collection("rdv")
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

                              title: new Text(document["Text"]),
                              subtitle:    new Text(" Le : " + document["day"].toString() + " " +
                                giveMonth(document["month"]) + " " +  document["year"].toString() )

                          );

                        }).toList(),
                      );
                  }
                },
              ),

              new MaterialButton(
                  height: 50.0,
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pushNamed(context, '/agenda');
                  },
                  child:
                  new Text("Ajouter une séance",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)

              ),





            ],
          ),
        ),
      ),
    );

  }
}



