import 'package:flutter/material.dart';

class NotificationsSwitch extends StatefulWidget {
  @override
  NotificationsSwitchState createState() => NotificationsSwitchState();
}

class NotificationsSwitchState extends State<NotificationsSwitch> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
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
