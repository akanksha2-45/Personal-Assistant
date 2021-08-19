import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_destek_sorted/Screens/RootPage.dart';
import 'package:new_destek_sorted/Screens/SignUp.dart';
import 'package:new_destek_sorted/Screens/forgotPassword.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_sign_in/google_sign_in.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
  filled: true,
  fillColor: Color(0x9AD38080),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black54,
    ),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: Colors.black),
  ),
  errorStyle: TextStyle(color: Colors.black),
);

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
  bool signedInWithGoogle=false;


Future<String> signInWithGoogle() async{
  await Firebase.initializeApp();
  signedInWithGoogle = true;

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    await flutterTts
              .speak("Welcome to,  DesTek, Your own, Personal Assistant.");
    
    return '$user';
  }
  return null;
}

Future<void> signOutWithGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

signOut() async{
  if(signedInWithGoogle){
    signOutWithGoogle();
    await FirebaseAuth.instance.signOut();
    flutterTts.speak("Good bye, Have a, Nice day.");
  }
  else{
    await FirebaseAuth.instance.signOut();
    flutterTts.speak("Good bye, Have a, Nice day.");
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
final FlutterTts flutterTts = FlutterTts();
class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  
  String text ="";

  Future speak(String text) async {
            await flutterTts.setLanguage("en-US");
            await flutterTts.setPitch(0.85);
            await flutterTts.setVolume(1.0);
            await flutterTts.setSpeechRate(0.90);
            await flutterTts.speak(text);
          }

  String _email;
  String _error;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      return true;
    }
    return false;
  }

FormType _formType = FormType.login;
 
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          // ignore: unused_local_variable
          final user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);

          await flutterTts.setLanguage("en-US");
          await flutterTts.setPitch(1);
          await flutterTts.setVolume(100.0);
          await flutterTts
              .speak("Welcome to,  DesTek, Your own, Personal Assistant.");

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RootPage()));
          print('Signed in: $_email and $_password');
        } else {
          // ignore: unused_local_variable
          final user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              "Created new Account, Welcome Aboard!!",
            ), //text
          ) //SnackBar
              );
          print('Signed in: $_email and $_password');
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _error = e.message;
        });
        speak(_error);
      }
    }
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.pink[200],
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(_error),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(height: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFF8CDCD),
          ),

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                showAlert(),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 70.0, bottom: 40.0, left: 60.0, right: 60.0),
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 50,
                          offset: Offset(0, 10)),
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'DesTek',
                      style: TextStyle(
                        color: Color(0xDEE47176),
                        fontFamily: 'Oregano',
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Text('Your Own Voice Assistant',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'PoiretOne',
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 35.0),
                new Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: new TextFormField(
                          validator: validateEmail,
                          onSaved: (value) => _email = value,
                          cursorHeight: 25.0,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                        child: new TextFormField(
                          onSaved: (value) => _password = value,
                          cursorHeight: 25.0,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Password',
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.black, size: 20),
                          ),
                        ),
                      ),

                      new FlatButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                          onPressed: () async{

                            speak("Oh Oh, look's like, You forgot your password. Don't worry, just type your email address, And, A reset link will be sent to you.");
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                                    
                          }),

                      SizedBox(height: 10),

                      RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: Color(0xB61A2E9E),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        highlightColor: Colors.red[200],
                        highlightElevation: 20.0,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        // textColor: Colors.black,
                        onPressed: validateAndSubmit,
                      ),

                      SizedBox(height: 15),

                      Divider(
                        color: Colors.black,
                        indent: 45,
                        endIndent: 45,
                      ),

                      SizedBox(height: 5),

                      // Center(
                      //     child: Text(
                      //   'OR',
                      //   style: TextStyle(fontSize: 18),
                      // )),

                      SizedBox(height: 19),

                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[

                              SizedBox(width: 40),

                              _signInButton()


                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 50),

                      GestureDetector(
                        onTap: () {
                          speak("Hey, Enter the below deatils, And, Your new account, Will be created.");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Create new account',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.0,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton(){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
  signInWithGoogle().then((result) {
    if (result != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return RootPage();
          },
        ),
      );
    }
  });
},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/googleIcon.png"), height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            )
          ],
        ),
      ),
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
