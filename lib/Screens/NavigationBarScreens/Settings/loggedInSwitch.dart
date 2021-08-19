import 'package:flutter/material.dart';

class LoggedInSwitch extends StatefulWidget {
  @override
  _LoggedInSwitchState createState() => _LoggedInSwitchState();
}

class _LoggedInSwitchState extends State<LoggedInSwitch> {
  static bool isSwitched = false;
  static var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Dark Theme';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Light Theme';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1.5,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
          )),
      Text(
        '$textValue',
        style: TextStyle(fontSize: 10),
      )
    ]);
  }
}
