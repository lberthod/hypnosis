import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:hypnosis/state_container.dart";
import "package:hypnosis/models/user.dart";

var auditif_score = 0;
var kine_score = 0;
var visuel_score = 0;

var questionNumber = 0;

var quiz = new Quizz();

class Quizz {
  var questions = [
    //  "Un animal s’approche de vous...",

    "Un animal s’approche de vous...",
    "Dans une salle de danse...",
    "Dans les transports en commun...",
    "À la plage, vous êtes sensible..",
    "Lorsque que vous essayez de vous rappeler de quelqu’un...",
    "Pour apprendre quelque chose de nouveau",
    "Pour résoudre un problème, vous préférez",
    "Pendant vos loisirs, vous aimez",
    "Pour communiquer avec une personne, vous préférez",
    "Si vous achetez un vêtement, vous décidez selon",
    "Si vous devez aller dans un endroit inconnu",
    "Après avoir regardé un film",
    "Lorsque vous parlez à quelqu’un",
    "Lorsque quelqu’un vous parle",
    "Devant un nouvel appareil, vous avez tendance à",
  ];

  var correct = [
    //answer 1
    [
      "1",
      "2",
      "3",
    ],
    [
      "1",
      "3",
      "2",
    ],
    [
      "3",
      "2",
      "1",
    ],
    [
      "1",
      "3",
      "2",
    ],
    [
      "2",
      "1",
      "3",
    ],

    [
      "2",
      "1",
      "3",
    ],
    [
      "2",
      "1",
      "3",
    ],
    [
      "3",
      "1",
      "2",
    ],
    [
      "1",
      "2",
      "3",
    ],
    [
      "3",
      "2",
      "1",
    ],

    [
      "1",
      "2",
      "3",
    ],
    [
      "2",
      "3",
      "1",
    ],
    [
      "2",
      "3",
      "1",
    ],
    [
      "1",
      "3",
      "2",
    ],
    [
      "2",
      "3",
      "1",
    ],
  ];

  var choices = [
    //answer 1
    [
      "Vous  ne comprenez pas trop ce qu'il veut",
      "Vous le prenez dans vos bras ",
      "Vous caressez doucement sa fourrure",
    ],

    //answer 2
    [
      "C’est la qualité de la musique qui est importante",
      "Vous êtes déjà en train de danser",
      "Vous observez le décor, les lumières ",
    ],

    //answer 3
    [
      "Vous êtes sensible à la température, aux odeurs",
      "Vous observez les passagers",
      "Vous écoutez les conversations",
    ],

    //answer 4
    [
      "Au bruit des vagues et des oiseaux",
      "A la sensation de l’air sur la peau, l’odeur de la mer, le sable sous les pieds ",
      "Au paysage, aux reflets sur la mer ",
    ],

    //answer 5
    [
      "Vous vous souvenez•mieux des visages et vous avez tendance à oublier les noms",
      "Vous vous rappelez le nom, mais pas le visage",
      "Vous vous rappelez•de ce que vous avez fait avec la personne, ou ce que vous avez ressenti ",
    ],

    //answer 6
    [
      "C’est plus facile si quelqu’un vous l’explique",
      "C’est plus facile si quelqu’un vous le montre",
      "C’est plus facile si vous pouvez le faire vous-même ",
    ],

    //answer 7
    [
      "Faire une liste de solution pour y voir plus clair",
      "Parler à haute voix pour organiser vos pensées",
      "Essayer tout de suite différentes solutions",
    ],

    //answer 8
    [
      "Faire du sport ou construire un objet",
      "Écouter de la musique, la radio ou jouer d’un instrument ",
      "Lire, regarder la télévision",
    ],

    //answer 9
    [
      "L’appeler au téléphone ",
      "Lui écrire une lettre ou un mail ",
      "La rencontrer en direct ",
    ],

    //answer 10
    [
      "Le coté confortable et la texture du tissu",
      "La coupe du vêtement, les couleurs",
      "Le rapport qualité/prix  ",
    ],

    //answer 11
    [
      "Vous retenez facilement les indications pour un chemin ",
      "Vous devez voir le plan ",
      "Vous avez besoin de dessiner le chemin pour mieux le comprendre",
    ],

    //answer 12
    [
      "Vous retenez surtout les images ",
      "Vous vous rappelez des émotions exprimées, de l’ambiance ",
      "Vous retenez surtout les paroles ",
    ],

    //answer 13
    [
      "Vous aimez qu’il vous regarde, sinon vous avez l’impression qu’il ne vous écoute pas ",
      "Vous avez besoin de le sentir près de vous",
      "Son attention vous suffit",
    ],

    //answer 14
    [
      "Vous êtes attentifs à ses paroles ",
      "Vous ressentez ses émotions  ",
      "Vous êtes attentif aux expressions de son visage ",
    ],

    //answer 15
    [
      "Lire le manuel d’instruction avant de vous en servir ",
      "Essayer le faire fonctionner avant d’avoir lu le manuel ",
      "Demander de l’aide à quelqu’un ",
    ],
  ];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(

            scrollDirection: Axis.vertical,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(15.0)),
                new Container(
                  alignment: Alignment.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Question ${questionNumber + 1} sur ${quiz.questions
                            .length}",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Container(
                  decoration: myBoxDecoration(),
                  child: new Text(
                    "Répondez à la question en cliquant sur le bouton adéquat",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(
                  "Questions : " + quiz.questions[questionNumber],
                  style: new TextStyle(
                      fontSize: 16.0,
                      decorationColor: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(
                  "1) " + quiz.choices[questionNumber][0],
                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      color: Colors.blueGrey,
                      onPressed: () {
                        int value = int.parse(quiz.correct[questionNumber][0]);


                        if (value == 1) {
                          auditif_score++;
                        }

                        if (value == 2) {
                          visuel_score++;
                        }
                        if (value == 3) {
                          kine_score++;
                        }

                        updateQuestion();
                      },
                      child: new Text(
                        "Choisir la réponse 1",
                        style:
                        new TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),

                    new Padding(padding: EdgeInsets.all(10.10)),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Text(
                  "2) " + quiz.choices[questionNumber][1],
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      color: Colors.blueGrey,
                      onPressed: () {
                        int value = int.parse(quiz.correct[questionNumber][1]);


                        if (value == 1) {
                          auditif_score++;
                        }

                        if (value == 2) {
                          visuel_score++;
                        }
                        if (value == 3) {
                          kine_score++;
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        "Choisir la réponse 2",
                        style:
                        new TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.10)),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Text(
                  "3) " + quiz.choices[questionNumber][2],
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      color: Colors.blueGrey,
                      onPressed: () {
                        int value = int.parse(quiz.correct[questionNumber][2]);


                        if (value == 1) {
                          auditif_score++;
                        }

                        if (value == 2) {
                          visuel_score++;
                        }
                        if (value == 3) {
                          kine_score++;
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        "Choisir la réponse 3",
                        style:
                        new TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),

                    new Padding(padding: EdgeInsets.all(10.10)),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child: new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text(
                          "Retour à l'accueil",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  void resetQuiz() {
    auditif_score = 0;
    kine_score = 0;
    visuel_score = 0;
    questionNumber = 0;

    setState(() {
      Navigator.pushNamed(context, '/agenda');

    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                new Summary(
                )));
      } else {
        questionNumber++;
      }
    });
  }

}

 class Summary extends StatelessWidget {


  final int score;
  var now = new DateTime.now();

  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    User user = container.user;

    Firestore.instance.collection("user-type")
        .document(user.uid)
        .collection("rdv")
        .add({
      "kine": kine_score,
      "auditif" : auditif_score,
      "visuel" : visuel_score,
      "date" : now,
    });

    void resetQuiz() {
      auditif_score = 0;
      kine_score = 0;
      visuel_score = 0;
      questionNumber = 0;

    }
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Votre score auditif : $auditif_score",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Text(
                "Votre score visuel : $visuel_score",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Text(
                "Votre score Kinesthésique : $kine_score",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  auditif_score = 0;
                  kine_score = 0;
                  visuel_score = 0;

                  Navigator.pop(context);
                },
                child: new Text(
                  "Recommencer le quizz",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),

                ),


              ),  //ResetQuizz
              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  auditif_score = 0;
                  kine_score = 0;
                  visuel_score = 0;

                  Navigator.of(context).pushNamed('/');
                },                child: new Text(
                "Retourner à l'accueil",

                style: new TextStyle(fontSize: 20.0, color: Colors.white),

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

