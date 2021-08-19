// import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:new_destek_sorted/Screens/SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

enum FormType { login, register, reset }

class _SignUPState extends State<SignUp> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final FlutterTts flutterTts = FlutterTts();
  String text = "";

  Future speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.95);
    await flutterTts.speak(text);
  }

  String _email;
  String _password;
  String _userName;
  FormType _formType = FormType.register;

  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          // ignore: unused_local_variable
          final user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          print('Signed in as: $_userName and $_email and $_password');
        } else {
          // ignore: unused_local_variable
          final user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          speak("Created new Account, Welcome Aboard!");
          showDialog(
              context: context,
              child: new AlertDialog(
                  title: new Text("Created new Account, Welcome Aboard!")));
          await new Future.delayed(const Duration(seconds: 2));

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));

          print('Signed up as : $_email and $_password');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 177, 177, 1),
      body: new Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              SizedBox(height: 90.0,),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 60.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset.fromDirection(5, -5),
                    )
                  ],
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0)),
                ),
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                child: Text(
                  "Create New Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Kurale',
                      color: Color.fromRGBO(246, 147, 147, 0.8)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset.fromDirection(10, -10),
                    )
                  ],
                  borderRadius: BorderRadius.all(const Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(73, 29, 249, 0.50),
                        Color.fromRGBO(254, 53, 53, 0.70)
                      ]),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 20),
                      new TextFormField(
                        validator: validateName,
                        onSaved: (value) => _userName = value,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.black,
                          contentPadding: EdgeInsets.only(left: 30.0),
                          icon: const Icon(
                            Icons.person,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new TextFormField(
                        validator: validateEmail,
                        onSaved: (value) => _email = value,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.only(left: 30.0),
                          icon: const Icon(Icons.email_outlined),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new TextFormField(
                        validator: validatePassword,
                        onSaved: (value) => _password = value,
                        controller: _pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.only(left: 30.0),
                          icon: const Icon(Icons.lock),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new TextFormField(
                        controller: _confirmPass,
                        validator: (val) {
                          if (val.isEmpty) return 'Field should not be empty';
                          if (val != _pass.text)
                            return 'Password does not match';
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.only(left: 30.0),
                          icon: const Icon(Icons.lock_outline),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new RaisedButton(
                        child: Text(
                          "Let's begin the journey!",
                        ),
                        onPressed: validateAndSubmit,
                        color: Colors.black,
                        textColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: 15.0,
                          bottom: 15.0,
                        ),
                      ),
                      new FlatButton(
                        child: new Text('Already have an account? Login'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Username is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Username must be a-z and A-Z';
  }
  return null;
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters';
  }
  return null;
}
