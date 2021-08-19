import 'dart:ui';

import 'package:flutter/material.dart';

class MyFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const MyFlexibleAppBar();

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromRGBO(250, 185, 185, 0.30),
        Color.fromRGBO(41, 99, 250, 0.20),
        Color.fromRGBO(244, 65, 173, 0.10)
      ], 
      stops: [
        0.1,
        0.60,
        0.99
      ])),
      child: new Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 70.0,
          ),
          Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: Text(
                "Stuck on how to use our services?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Rancho',
                  fontSize: 30.0,
                ),
              )),
          // SizedBox(
          //   height: 5.0,
          // ),
          Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
              // alignment: Alignment.center,
              child: Text(
                "Check out all the features we offer and choose your favorite ones!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Rasa',
                  fontSize: 20.0,
                ),
              ))
        ],
      )),
    );
  }
}
