import 'package:flutter/material.dart';
import 'package:hypnosis/ui/agenda.dart';

import 'package:hypnosis/ui/splash.dart';
import 'package:hypnosis/ui/login.dart';
import 'package:hypnosis/ui/chat-screen.dart';
import 'package:hypnosis/ui/admin-chat-list.dart';
import 'package:hypnosis/state_container.dart';

void main() => runApp(StateContainer(child: MyApp()));


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SpashScreen(),
      routes: {
        '/login': (context) => LoginView(),
        '/chat': (context) => ChatList(),
        '/agenda': (context) => AgendaView(),

      },

    );
  }
}


