import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Feature6 extends StatefulWidget {

  Feature6({Key key}) : super(key: key);

  @override
  _Feature6State createState() => _Feature6State();
}

class _Feature6State extends State<Feature6> {
  SpeechToText stt = SpeechToText();
  bool isListening = false;
  String text = '';
  double accuracy = 1.0;

  @override
  void initState() {
    initializeAudio();
    super.initState();
  }

  initializeAudio() async {
    stt.initialize();
  }

  _listen() async {
    if (stt.isAvailable) {
      if (!isListening) {
        stt.listen(onResult: (result) {
          setState(() {
            accuracy = result.confidence;
            text = result.recognizedWords;
            print("Accuracy is: $accuracy");
            isListening = true;
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(      
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
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
                              gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff355C7D),
                                Color(0xff6C5B7B),
                                Color(0xff6C5B7B),
                            
                              ],
                            ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(color: Colors.white38, blurRadius: 30),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Write It',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  'Press on the mic icon and start speaking clearly and DesTek will write it for you.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 20,
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
                             gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff355C7D),
                                Color(0xff6C5B7B),
                                Color(0xff6C5B7B),
                            
                              ],
                            ),
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          boxShadow: [
                            BoxShadow(color: Colors.white38, blurRadius: 30),],
                         ),
                          child: Center(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Roboto'
                                ),
                            ),
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
                              icon: Icon((isListening ? Icons.mic : Icons.mic_none_outlined), size: 40,),
                              onPressed: _listen,
                            ),
                            // child: GestureDetector(
                            //   child: Container(
                            //     padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                            //     decoration: BoxDecoration(
                            //       color: Colors.blue[200],
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(20)),
                            //     ), 
                            //     child: Text(
                            //       "Speak",
                            //       style: TextStyle(
                            //           fontFamily: 'Poly', fontSize: 18.0),
                            //     ),
                            //   ),
                            //   onTap: () => _speak(textEditingController.text),
                            // ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 140.0),
                        child: Image.asset('assets/images/bottomWaves.png'),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
