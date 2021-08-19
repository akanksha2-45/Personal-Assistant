import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Feature3 extends StatefulWidget {
  @override
  _Feature3State createState() => _Feature3State();
}

class _Feature3State extends State<Feature3> {
  TextEditingController textEditingController = TextEditingController();
  // String _url ;

  _launchUrl(String text) async {
    // setState(() {
    //   _url = text;
    // });
    if (await canLaunch(text)) {
      await launch(text);
      print("Launched $text");
    } else {
      print("Could not launch $text");
      throw 'Could Not launch "text"';
    }
  }

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
                          // color: Color(0xD06687AC),
                         gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFDE6262),

                                Color(0xFFFFB88C),
                               
                              ],
                            ),  
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'URL opener',
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
                                  'Enter the url you want to open, and DesTek will launch it for you.',
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
                      height: 20,
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
                                Color(0xFFDE6262),
                                Color(0xFFFFB88C),
                              
                              ],
                            ),  
                          ),
                          child: Center(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: textEditingController,
                            ),
                          )),
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
                                  "Open",
                                  style: TextStyle(
                                      fontFamily: 'Poly', fontSize: 18.0),
                                ),
                              ),
                              onTap: () =>
                                  _launchUrl(textEditingController.text),
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
