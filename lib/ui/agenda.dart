import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypnosis/widets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:hypnosis/state_container.dart";
import "package:hypnosis/models/user.dart";

class AgendaView extends StatefulWidget {
  final Widget child;

  AgendaView({Key key, this.child}) : super(key: key);

  AgendaState createState() => AgendaState();
}


class AgendaState extends State<AgendaView>{

  String textRDV = "";
  DateTime rdv = DateTime.now();
  TextEditingController infoRDV = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final container = StateContainer.of(context);
    User user = container.user;

    return new MaterialApp(
      title: 'Container with scaffold',
      home: Scaffold(
        body: Container(
          // color: Colors.blue,
          height: double.infinity,// provides unbounded height constraints for the child container
          width: double.infinity,// provides unbounded width constraints for the child container

          child: new Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text(" Création de rendez-vous"),

              new Padding(padding: EdgeInsets.all(8.0)),
              new MaterialButton(
                  height: 50.0,
                  color: Colors.green,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirms $date');
                          print (date.day);
                          print ("ICCC" + user.uid.toString());
                          setState(() {
                            rdv = date;

                          });


                        }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                  child:
                  new Text("Choisir une date",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)

    ),
              new Padding(padding: EdgeInsets.all(8.0)),
              new Text(" Date Choisie : "),

              new Text(" Jour : " + rdv.day.toString()),
              new Text(" Mois : " + rdv.month.toString()),
              new Text(" Année : " + rdv.year.toString()),

              TextField(controller: infoRDV,
                             ),

          new MaterialButton( height: 50.0,
    color: Colors.green,
    onPressed: () {
      Firestore.instance.collection("user-agenda")
          .document(user.uid)
          .collection("rdv")
          .add({
        "day": rdv.day,
        "month" : rdv.month,
        "year" : rdv.year,
        "Text": infoRDV.text,

      });
    },
              child:
              new Text("Envoyer en ligne",
                style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                ),)


    ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new MaterialButton( height: 50.0,
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');

                  },
                  child:
                  new Text("GoList",
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



