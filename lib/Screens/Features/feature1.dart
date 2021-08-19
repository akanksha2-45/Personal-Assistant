import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Feature1 extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  Feature1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    Future _speak(String text) async {
      // await selectVoice();
      // await flutterTts.setVoice('en-us-x-sfg#male_1-local');
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.setVolume(1.0);
      await flutterTts.speak(text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //           gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Color(0xFFFF8D7E),
            //     Color(0xFFFF559F),
            //     // Color(0xFFCF5CCF),
            //     // Color(0xFFFF57AC),
            //     // Color(0xFFFF6D91),
            //     // Color(0xFFFF8D7E),
            //     // Color(0xFFB6BAA6),
            //   ],
            // ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(0),
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
                          // color: Color(0xff7C7B94),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFFFF8D7E),
                              Color(0xFFFF559F),
                            ],
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Speak Aloud',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  'Enter some text and see your assistant DesTek speak it.',
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
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                            boxShadow: [
                              BoxShadow(color: Colors.white38, blurRadius: 30),
                            ],
                            // color: Color(0xffD0B3B3),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFFF8D7E),

                                Color(0xFFFF559F),
                                // Color(0xFFCF5CCF),
                                // Color(0xFFFF57AC),
                                // Color(0xFFFF6D91),
                                // Color(0xFFFF8D7E),
                                // Color(0xFFB6BAA6),
                              ],
                            )),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: textEditingController,
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
                            //   child: IconButton(
                            //   icon: Icon(Icons.mic, size: 40,),
                            //   onPressed: () => _speak(textEditingController.text),
                            // ),
                            child: GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 20.0,
                                    right: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Text(
                                  "Speak",
                                  style: TextStyle(
                                      fontFamily: 'Poly', fontSize: 18.0),
                                ),
                              ),
                              onTap: () => _speak(textEditingController.text),
                              // onTap:  () => setVoice(textEditingController.text),
                            ),
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
