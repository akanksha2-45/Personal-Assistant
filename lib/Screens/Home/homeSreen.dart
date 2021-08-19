import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:new_destek_sorted/Screens/Features/feature1.dart';
import 'package:new_destek_sorted/Screens/Features/feature10.dart';
import 'package:new_destek_sorted/Screens/Features/feature11.dart';
import 'package:new_destek_sorted/Screens/Features/feature2.dart';
import 'package:new_destek_sorted/Screens/Features/feature3.dart';
import 'package:new_destek_sorted/Screens/Features/feature4.dart';
import 'package:new_destek_sorted/Screens/Features/feature6.dart';
import 'package:new_destek_sorted/Screens/Features/feature7.dart';
import 'package:new_destek_sorted/Screens/Features/feature8/feature8.dart';
import 'package:new_destek_sorted/Screens/Features/feature9.dart';
import 'package:new_destek_sorted/Screens/Features/features5.dart';
import 'package:shimmer/shimmer.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SpeechToText stt = SpeechToText();
  bool isListening = false;
  String text = '';
  double accuracy = 1.0;

  @override
  void initState() {
    initializeAudio();
    super.initState();
  }

  initializeAudio() {
    stt.initialize();
  }

  _listen() async {
    if (stt.isAvailable) {
      if (!isListening) {
        await stt.listen(onResult: (result) {
          setState(() {
            accuracy = result.confidence;
            text = result.recognizedWords;
            print("Accuracy is: $accuracy");
            isListening = true;
            _voiceCommand(text);
            isListening = false;
          });
        });
      } else {
        setState(() {
          isListening = false;
          stt.stop();
        });
      }
    } else {
      print("Permission was denied");
    }
  }

  _voiceCommand(String text) async {
    if (text.toLowerCase() == "speak aloud" || text.toLowerCase() == "speak") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature1()));
    } else if (text.toLowerCase() == "translator" ||
        text.toLowerCase() == "translate text") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature2()));
    } else if (text.toLowerCase() == "url opener" ||
        text.toLowerCase() == "open url") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature3()));
    } else if (text.toLowerCase() == "make a call" ||
        text.toLowerCase() == "call") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature4()));
    } else if (text.toLowerCase() == "send sms" ||
        text.toLowerCase() == "send message") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature5()));
    } else if (text.toLowerCase() == "write it" ||
        text.toLowerCase() == "write") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature6()));
    } else if (text.toLowerCase() == "send mail" ||
        text.toLowerCase() == "send email") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature7()));
    } else if (text.toLowerCase() == "news update" ||
        text.toLowerCase() == "latest news") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature8()));
    } else if (text.toLowerCase() == "date and time" ||
        text.toLowerCase() == "what is the current date and time") {
          
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature9()));
    } else if (text.toLowerCase() == "weather" ||
        text.toLowerCase() == "current weather") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature10()));
    } else if (text.toLowerCase() == "dictionary" ||
        text.toLowerCase() == "open dictionary") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Feature11()));
    }
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1.0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarIconBrightness: Brightness.light,
    ));

    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 130),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"),
            fit: BoxFit.cover
          )
          ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.red[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            // height: 128,
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.menu_open_rounded, size: 40, color: Colors.white),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1.0;
                              isDrawerOpen = false;
                            },
                          );
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu, size: 40, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            xOffset = 200;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                Shimmer.fromColors(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, left: 40.0),
                      child: Text(
                        'DesTek',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oregano',
                          fontSize: 45,
                        ),
                      ),
                    ),
                    baseColor: Colors.white,
                    highlightColor: Colors.blue[300]),
                Container(
                  padding: EdgeInsets.only(top: 18.0, right: 5.0),
                  child: AvatarGlow(
                    animate: true,
                    showTwoGlows: true,
                    glowColor: Colors.green,
                    endRadius: 50.0,
                    duration: const Duration(milliseconds: 2000),
                    repeatPauseDuration: const Duration(milliseconds: 100),
                    repeat: true,
                    startDelay: const Duration(milliseconds: 300),
                    child: Row(children: [
                      IconButton(
                        padding: EdgeInsets.only(left: 30.0),
                        icon: isListening
                            ? Icon(Icons.mic_none, size: 40)
                            : Icon(Icons.mic, size: 40, color: Colors.white),
                        onPressed: _listen,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.only(
                top: 40.0, bottom: 40.0, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 2,
                      offset: Offset(0, 3)),
                ],
                borderRadius: BorderRadius.circular(300)),
            child: Center(
              child: Text(text,
                  style: TextStyle(color: Colors.purple, fontSize: 20.0)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature1()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(241, 113, 243, 0.8)
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.deepPurpleAccent,
                            child: Align(
                              child: Hero(
                                tag: 1,
                                child: Image.asset(
                                  'assets/images/speakAloud.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 128, 255, 0.8)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Speak Aloud',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Oregano',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature2()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 9,
                                      offset: Offset(0, 3)),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(101, 220, 102, 0.8)
                                ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.green,
                            child: Align(
                              child: Hero(
                                tag: 2,
                                child: Image.asset(
                                  'assets/images/translator.png',
                                  width: 150,
                                  height: 300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(165, 249, 168, 0.8)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 35),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Translator',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Oregano',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature3()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 9,
                                      offset: Offset(0, 3)),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color:Color.fromRGBO(110, 148, 243, 0.8)
                                ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.blue,
                            child: Align(
                              child: Hero(
                                tag: 3,
                                child: Image.asset(
                                  'assets/images/web_search.png',
                                  width: 150,
                                  height: 300,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(156, 184, 253, 0.8)
                          ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 35),
                          child: Container(
                            margin: EdgeInsets.only( top:10.0,
                                bottom: 10, left: 15, right: 15),
                            child: Text(
                              'URL Opener',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature4()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 9,
                                      offset: Offset(0, 3)),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(247, 189, 200, 0.8)),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.pink[400],
                            child: Align(
                              child: Hero(
                                tag: 4,
                                child: Image.asset(
                                  'assets/images/makeACall.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 211, 218, 0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 30, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Make a Call',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature5()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(225, 191, 172, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.orange[300],
                            child: Align(
                              child: Hero(
                                tag: 5,
                                child: Image.asset(
                                  'assets/images/sendSMS.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(234, 208, 193, 0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 25, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Send SMS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature6()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 9,
                                      offset: Offset(0, 3)),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(194, 181, 222, 0.8)),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.deepPurple,
                            child: Align(
                              child: Hero(
                                tag: 6,
                                child: Image.asset(
                                  'assets/images/writeIt.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFCFCCE2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 30, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Write It',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature7()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(176, 213, 167, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.greenAccent,
                            child: Align(
                              child: Hero(
                                tag: 7,
                                child: Image.asset(
                                  'assets/images/sendMail.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 223, 190, 0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 30, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'Send Mail',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature8()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(169, 190, 225, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.blueAccent,
                            child: Align(
                              child: Hero(
                                tag: 8,
                                child: Image.asset(
                                  'assets/images/newsUpdate.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(192, 208, 234, 0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 30, bottom: 10, left: 15, right: 15),
                            child: Text(
                              'News update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feature9()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(250, 200, 200, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.pink[100],
                            child: Align(
                              child: Hero(
                                tag: 9,
                                child: Image.asset(
                                  'assets/images/date_and_time.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(249, 216, 216, 0.8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 15, right: 15, top: 25),
                            child: Text(
                              'Date & Time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Feature10()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(240, 209, 168, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.yellow[200],
                            child: Align(
                              child: Hero(
                                tag: 10,
                                child: Image.asset(
                                  'assets/images/weather.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 217, 189, 0.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 15, right: 15, top: 20),
                            child: Text(
                              'Weather',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Feature11()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 140,
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 9,
                                    offset: Offset(0, 3)),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(186, 224, 161, 0.8),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.lightGreenAccent,
                            child: Align(
                              child: Hero(
                                tag: 11,
                                child: Image.asset(
                                  'assets/images/dictionary.png',
                                  width: 100,
                                  height: 250,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(201, 227, 184, 0.8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 15, right: 15, top: 20),
                            child: Text(
                              'Dictionary',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Oregano',
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 30,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 9, offset: Offset(0, 3)),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.redAccent[100],
            ),
            child: Center(
                child: Text(
              'Made with Love By DesTek Team',
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Oregano',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
          )
        ])));
  }
}
