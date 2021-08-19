import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:new_destek_sorted/Screens/SignIn.dart';
import 'package:new_destek_sorted/Screens/SignUp.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  FormType _formType = FormType.reset;

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
        if (_formType == FormType.reset) {
          print("Password reset email sent at $_email");
          // ignore: unused_local_variable
          final user = await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 250.0),
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(246, 147, 147, 0.7),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                color: Color.fromRGBO(246, 147, 147, 1),
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.all(4.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Expanded(
                  // child: SvgPicture.asset("assets/images/Person.svg"),
                  child: Image.asset("assets/images/Person.png"),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 180,
                        ),
                        Text(
                          "Forgot your password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Enter you Email address and we’ll send you the password reset link.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NotoSerif',
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              // child: Stack(
              //   children: [
              // Expanded(
              //   child:
              child: Container(
                  padding: EdgeInsets.only(left: 70.0, right: 70.0),
                  color: Color.fromRGBO(70, 67, 131, 1),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            validator: validateEmail,
                            onSaved: (value) => _email = value,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: "Enter your Email ID",
                              hintStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 116, 116, 1),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          new RaisedButton(
                            child: Text("Send Reset link"),
                            color: Color.fromRGBO(255, 116, 116, 1),
                            elevation: 10.0,
                            onPressed: () {
                              validateAndSubmit();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 30.0,
                              top: 12.0,
                              bottom: 12.0,
                            ),
                          ),
                        ],
                      ))),
              // ),
              // ]
              // ),
            ),
          ],
        ),
        Positioned(
          top: 420.0,
          right: 30.0,
          // child: SvgPicture.asset('assets/images/Forgot_icon.svg'),
          child: Image.asset("assets/images/Forgot_icon.png"),
        ),
      ]),
    );
  }
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
