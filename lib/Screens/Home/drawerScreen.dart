import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_destek_sorted/Screens/NavigationBarScreens/Settings/settings_page.dart';
import 'package:new_destek_sorted/Screens/NavigationBarScreens/feedback_page.dart';
import 'package:new_destek_sorted/Screens/NavigationBarScreens/favorites_page.dart';
import 'package:new_destek_sorted/Screens/NavigationBarScreens/profile_page.dart';
import 'package:new_destek_sorted/Screens/SignIn.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String text = "";
  String name = "";
  // String email = "";
  // String photo = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  String returnUser() {
    print(auth.currentUser.displayName);
    name = auth.currentUser.displayName;
    return name;
  }

  // String returnEmail() {
  //   print(auth.currentUser.email);
  //   email = auth.currentUser.email;
  //   return email;
  // }

  // String returnPhoto() {
  //   print(auth.currentUser.photoURL);
  //   photo = auth.currentUser.photoURL;
  //   return photo;
  // }

  Future speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(0.85);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.90);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50, bottom: 20, left: 15),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.deepPurple[700], 
                    Colors.purple[500]
                  ]
                )
              ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // ClipOval(
                    //     child: Image(
                    //   image: NetworkImage(returnPhoto()),
                    //   width: 60,
                    //   height: 60,
                    //   fit: BoxFit.cover,
                    // )),

                    SizedBox(
                      width: 25,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            returnUser(),
                            // "User",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontFamily: 'Oregano'),
                          ),
                          // Text(
                          //   returnEmail(),
                          //   // "Email",
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 26,
                          //       fontFamily: 'Oregano'),
                          // ),
                          Text('Active Status',
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ])
                  ],
                ),
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: Colors.black,
                          size: 32,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Favorites()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 32,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Text(
                          'Fun Games',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackPage()));
                    },
                    child: Container(
                      child: Row(children: [
                        Icon(
                          Icons.mail,
                          color: Colors.black,
                          size: 32,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Text(
                          'Feedback',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ]),
                    ),
                  ),
                ]),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 30, color: Colors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 2,
                        height: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new FlatButton(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        onPressed: () async {
                          signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      )
                    ],
                  ),
                ),
              ])),
    );
  }
}
