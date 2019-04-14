import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:firebase_storage/firebase_storage.dart';

class ChoixView extends StatefulWidget {
  final Widget child;

  ChoixView({Key key, this.child}) : super(key: key);

  ChoixViewState createState() => ChoixViewState();
}

class ChoixViewState extends State<ChoixView> {

  double correctScore = 0.0;
  int _radioValue1 = 3;
  int _radioValue2 = 3;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          correctScore++;
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          correctScore++;
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
        appBar: AppBar(
        title: new Text('Séance personnalisée'),
    centerTitle: true,
    backgroundColor: Colors.blue,
    ),
    body: new Container(
    padding: EdgeInsets.all(8.0),
    child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text(
        'Défini les caractéristiques pour trouver une séance adaptée à vous besoin ',
        style: new TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
      new Padding(
        padding: new EdgeInsets.all(15.0),
      ),
    new Text(
    'Choisis le thérapeute',
    style: new TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    new Padding(
    padding: new EdgeInsets.all(8.0),
    ),
    new Divider(height: 5.0, color: Colors.black),
    new Padding(
    padding: new EdgeInsets.all(8.0),
    ),

    new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Radio(
    value: 0,
    groupValue: _radioValue1,
    onChanged: _handleRadioValueChange1,
    ),
    new Text(
    'Soisic',
    style: new TextStyle(fontSize: 12.0),
    ),
    new Radio(
    value: 1,
    groupValue: _radioValue1,
    onChanged: _handleRadioValueChange1,
    ),
    new Text(
    'Paul',
    style: new TextStyle(
    fontSize: 12.0,
    ),
    ),
    new Radio(
    value: 2,
    groupValue: _radioValue1,
    onChanged: _handleRadioValueChange1,
    ),
    new Text(
    'Luc',
    style: new TextStyle(fontSize: 12.0),
    ),
    ],
    ),

    new Padding(
      padding: new EdgeInsets.all(8.0),
    ),
    new Text(
      'Choisis le type',
      style: new TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    new Divider(height: 5.0, color: Colors.black),

    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Radio(
          value: 0,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Visuel',
          style: new TextStyle(fontSize: 12.0),
        ),
        new Radio(
          value: 1,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Kinésthésique',
          style: new TextStyle(
            fontSize: 12.0,
          ),
        ),
        new Radio(
          value: 2,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Auditif',
          style: new TextStyle(fontSize: 12.0),
        ),
      ],
    ),


    new Padding(
      padding: new EdgeInsets.all(8.0),
    ),
    new Text(
      'Choisis la durée',
      style: new TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    new Divider(height: 5.0, color: Colors.black),

    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Radio(
          value: 0,
          groupValue: _radioValue2,
          onChanged: _handleRadioValueChange2,
        ),
        new Text(
          '-5 min',
          style: new TextStyle(fontSize: 12.0),
        ),
        new Radio(
          value: 1,
          groupValue: _radioValue2,
          onChanged: _handleRadioValueChange2,
        ),
        new Text(
          '5-10 min',
          style: new TextStyle(
            fontSize: 12.0,
          ),
        ),
        new Radio(
          value: 2,
          groupValue: _radioValue2,
          onChanged: _handleRadioValueChange2,
        ),
        new Text(
          '+10 min',
          style: new TextStyle(fontSize: 12.0),
        ),

      ],
    ),


    new Padding(
      padding: new EdgeInsets.all(8.0),
    ),
    new MaterialButton(
        height: 50.0,
        color: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, '/agenda');
        },
        child:
        new Text("Trouver sa séance",
          style: new TextStyle(
              fontSize: 18.0,
              color: Colors.white
          ),)

    ),
    ]
    )
    )
    )

    );
  }
}