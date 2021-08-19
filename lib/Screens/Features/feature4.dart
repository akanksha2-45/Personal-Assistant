import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:native_contact_picker/native_contact_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Feature4 extends StatefulWidget {
  @override
  _Feature4State createState() => _Feature4State();
}

class _Feature4State extends State<Feature4> {
  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact;
  String _number;

  launchUrl(String url) async {
    setState(() {
      if (_number.length > 10) {
        String result = _number.substring(3, 13);
        url = result;
      } else {
        url = _number;
      }
    });

    print("Call for contact is: $url");
    if (await canLaunch("tel: $url")) {
      print("Call was made to $_number");
      await launch("tel: $url");
    } else {
      print("Call was not made to $_number");
      throw "Could not launch $url";
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
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff8360c3),
                              Color(0xff2ebf91),
                            ]
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Make a call',
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
                                  'Just click on the below icon and pic the person you want to make a call to. Then click call.',
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
                            gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff8360c3),
                              Color(0xff2ebf91),
                            ]
                          ),
                          ),
                          child: Center(
                            child: new Text(
                              _contact == null
                                  ? 'No contact selected.'
                                  : _contact.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          )),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: new MaterialButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.blue[200],
                          
                        child: new Text(
                          "Select Contact",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          Contact contact =
                              await _contactPicker.selectContact();
                          setState(() {
                            _contact = contact;
                            _number = contact.phoneNumber;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                                  "Call",
                                  style: TextStyle(
                                      fontFamily: 'Poly', fontSize: 18.0),
                                ),
                              ),
                              onTap: () => launchUrl('tel:$_number'),
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
