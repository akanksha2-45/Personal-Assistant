import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Colors.green[200],
              Colors.blue,
              Color(0xFF00FF99),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ]),
                  )),
                  Center(
                    child: Container(
                      height: 250,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomLeft,
                          //   colors: [
                          //     Colors.green[200],
                          //     Colors.blue[300],
                          //     Colors.green[100],
                          //     // Color(0xFFFF8D7E),
                          //     // Color(0xFFFF559F),
                          //     // Color(0xFFCF5CCF),
                          //     // Color(0xFFFF57AC),
                          //     // Color(0xFFFF6D91),
                          //     // Color(0xFFFF8D7E),
                          //     // Color(0xFFB6BAA6),
                          //   ],
                          // ),
                          boxShadow: [
                            BoxShadow(color: Colors.white38, blurRadius: 30),
                          ],
                          // color: Colors.white,
                          // color: Color.fromRGBO(75, 71, 179, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      margin: EdgeInsets.symmetric(vertical: 35.0),
                      child: Center(
                        child: Text(
                          'Give Your Feedback Here',
                          style: TextStyle(
                            // color: Color.fromRGBO(75, 71, 179, 1),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //       gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomLeft,
                  //   colors: [
                  //                     Color(0xFFFF8D7E),

                  //     Color(0xFFFF559F),
                  //     // Color(0xFFCF5CCF),
                  //     // Color(0xFFFF57AC),
                  //     // Color(0xFFFF6D91),
                  //     // Color(0xFFFF8D7E),
                  //     // Color(0xFFB6BAA6),

                  //   ],

                  // ),

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 80),
                        Row(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.0)),
                            Text(
                              'Click this button to give your',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 19),
                        Row(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 42.0)),
                            Text(
                              ' feedback to us',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        RaisedButton(
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          // color: Color.fromRGBO(75, 71, 179, 1),
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          disabledColor: Colors.grey,
                          highlightColor: Color(0xD06687AC),
                          child: Text(
                            'Feedback',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                          ),
                          textColor: Colors.white,
                          onPressed: () => Wiredash.of(context).show(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
