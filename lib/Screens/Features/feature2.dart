import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Feature2 extends StatefulWidget {
  @override
  _Feature2State createState() => _Feature2State();
}

class _Feature2State extends State<Feature2> {
  // const Feature2({Key key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();
  var output;
  String dropdownValue;

  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Chinese": "zh-cn",
    "Urdu": "ur",
    "Gujrati": "gu",
    "Japanese": "ja",
    "Korean": "ko",
    "Turkish": "tr"
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  Future _speak(String text) async {
    await flutterTts.setLanguage("$dropdownValue");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }

  // String _text = 'Press the icon to start speaking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
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
                            // color: Color(0xC95F9477),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.blue,
                                Color(0xFFFF559F),
                             
                              ],
                            ),
                            ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Translate',
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
                                  'Enter the text you want to translate, and choose the language in which you want to convert it.',
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
                      height: 30,
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
                                Colors.blue,

                                Color(0xFFFF559F),
                                // Color(0xFFCF5CCF),
                                // Color(0xFFFF57AC),
                                // Color(0xFFFF6D91),
                                // Color(0xFFFF8D7E),
                                // Color(0xFFB6BAA6),
                              ],
                            ),
                        ),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: "Type here",
                            ),
                            onTap: () {
                              trans();
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Select your language",
                            style:
                                TextStyle(fontFamily: 'Poly', fontSize: 20.0)),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              trans();
                            });
                          },
                          items: lang
                              .map((string, value) {
                                return MapEntry(
                                    string,
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(string),
                                    ));
                              })
                              .values
                              .toList(),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Text(
                        output == null
                            ? "Please Select Language"
                            : output.toString(),
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          child: Icon(
                            Icons.clear,
                            color: Colors.purple,
                          ),
                          elevation: 15.0,
                          onPressed: () {
                            textEditingController.text = "";
                          },
                        ),
                        MaterialButton(
                          child: Icon(
                            Icons.content_copy,
                            color: Colors.purple,
                          ),
                          elevation: 15.0,
                          onPressed: () {
                            Clipboard.setData(
                                new ClipboardData(text: output.toString()));
                          },
                        ),
                      ],
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
                              onPressed: () => _speak(output.toString()),
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
