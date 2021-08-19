import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:new_destek_sorted/Screens/Home/drawerScreen.dart';
import 'package:new_destek_sorted/Screens/Home/homeSreen.dart';
import 'package:new_destek_sorted/Screens/SignIn.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  
  @override
  Widget build(BuildContext context) {
    // Get the firebase user
    User firebaseUser = FirebaseAuth.instance.currentUser;

// Assign widget based on availability of currentUser
    if (firebaseUser != null) {
      return Scaffold(
        body: Stack(
          children: [DrawerScreen(), HomeScreen()],
        ),
      );
    } else {
      return Login();
    }
  }
}

