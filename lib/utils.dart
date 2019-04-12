import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color arrayToColour(List<int> color){
  return Color.fromRGBO(color[0], color[1], color[2], 1);
}

List<int> colorToArray(Color c){
    List<int> color = new List<int>();
    color.insert(0, c.red);
    color.insert(1, c.green);
    color.insert(2, c.blue);
    return color;
}

class AuthUtil {

  static Future<String> getUserId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    if(user==null){
      return null;
    };
    assert(await user.getIdToken() != null);

    return user.uid;
  }

  static Future<FirebaseUser> handleSignInEmail(String email, String password) async {

    if (email.isEmpty || password.isEmpty) {
      return null;
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.signInWithEmailAndPassword(
        email: email, password: password);

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);
    
    return user;
  }

  static Future<FirebaseUser> handleSignUp(email, password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    assert (user != null);
    assert (await user.getIdToken() != null);

    return user;
  }

  static Future<Null> handleSignOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}