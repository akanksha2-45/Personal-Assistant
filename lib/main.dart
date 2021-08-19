import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_destek_sorted/Screens/RootPage.dart';
import 'package:wiredash/wiredash.dart';
import 'constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: projectId,
      secret: secret,
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        home: new RootPage(),
      ),
    );
  }
}
