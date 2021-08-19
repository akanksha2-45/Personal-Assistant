import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Feature9 extends StatefulWidget {
  Feature9({Key key}) : super(key: key);

  @override
  _Feature9State createState() => _Feature9State();
}

class _Feature9State extends State<Feature9> {
  final FlutterTts flutterTts = FlutterTts();

  DateTime now = new DateTime.now();

  Future _speak(String now) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(now);
    await flutterTts.setSpeechRate(0.90);
  }

  @override
  void initState() {
    super.initState();
    _speak(
        "Today's date is, ${now.day}, ${now.month}, ${now.year}, and, Current time is, ${now.hour} hours, ${now.minute} minutes, and, ${now.second} seconds");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                          margin: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(color: Colors.white38, blurRadius: 30),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                // Color(0xFFC6FFDD),
                                Color(0xFFBE93C5),
                                Color(0xFF7BC6CC),
                              ],
                            ),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Date & Time',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Text(
                                    'Know current date and time.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontFamily: 'Poly'),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: Container(
                          height: 145,
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 5.0, bottom: 30.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                            boxShadow: [
                              BoxShadow(color: Colors.white38, blurRadius: 30),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                // Color(0xFFC6FFDD),
                                Color(0xFFBE93C5),
                                Color(0xFF7BC6CC),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    text: "Today's date is: ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.black87),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            " ${now.day}:${now.month}:${now.year}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Current time is: ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.black87),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            " ${now.hour}:${now.minute}:${now.second}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(children: [
                        Container(
                          child: Center(
                            child: AvatarGlow(
                              animate: true,
                              glowColor: Colors.blue[200],
                              endRadius: 85.0,
                              duration: const Duration(milliseconds: 2000),
                              repeatPauseDuration:
                                  const Duration(milliseconds: 100),
                              repeat: true,
                              child: IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  size: 40,
                                ),
                                onPressed: () => _speak(
                                    "Today's date is, ${now.day}, ${now.month}, ${now.year}, and, Current time is, ${now.hour} hours, ${now.minute} minutes, and, ${now.second} seconds"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 130.0),
                          child: Image.asset(
                            'assets/images/bottomWaves.png',
                            width: 2020,
                          ),
                        ),
                      ]),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
