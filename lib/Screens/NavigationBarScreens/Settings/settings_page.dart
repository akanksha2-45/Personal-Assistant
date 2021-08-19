import 'package:flutter/material.dart';
// import 'package:new_destek_sorted/Screens/NavigationBarScreens/Settings/loggedInSwitch.dart';
// import 'package:new_destek_sorted/Screens/NavigationBarScreens/Settings/notificationsSwitch.dart';
import 'package:permission_handler/permission_handler.dart';
import 'voiceSwitch.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 199, 199, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 147, 147, 1),
        toolbarHeight: 70.0,
        leadingWidth: 60.0,
        leading: Container(
          margin: EdgeInsets.only(left: 10.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(186, 212, 227, 1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Color.fromRGBO(186, 212, 227, 1),
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
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Rancho', fontSize: 30.0),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(186, 212, 227, 1),
                shape: BoxShape.circle),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 25.0,
            ),
          )
        ],
      ),
      body: settingsBody(),
    );
  }
}

Widget settingsBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        height: 70,
        width: 300,
        margin:
            EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0, bottom: 20.0),
        padding: EdgeInsets.only(left: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Female Or Male Voice",
              style: TextStyle(fontFamily: 'Rancho', fontSize: 20.0)),
          Expanded(
            child: VoiceSwitch(),
          )
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color.fromRGBO(238, 181, 181, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(206, 169, 169, 1),
                offset: Offset(10.0, 10.0),
                blurRadius: 30.0,
              ),
              BoxShadow(
                color: Color.fromRGBO(255, 229, 229, 1),
                offset: Offset(-10.0, -10.0),
                blurRadius: 30.0,
              )
            ]),
      ),
      // Container(
      //   height: 70,
      //   width: 300,
      //   margin:
      //       EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
      //   padding: EdgeInsets.only(left: 20.0),
      //   child:
      //       Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      //     Text("Theme", style: TextStyle(fontFamily: 'Rancho', fontSize: 20.0)),
      //     Expanded(
      //       child: LoggedInSwitch(),
      //     )
      //   ]),
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.all(Radius.circular(25)),
      //       color: Color.fromRGBO(238, 181, 181, 1),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Color.fromRGBO(206, 169, 169, 1),
      //           offset: Offset(10.0, 10.0),
      //           blurRadius: 30.0,
      //         ),
      //         BoxShadow(
      //           color: Color.fromRGBO(255, 229, 229, 1),
      //           offset: Offset(-10.0, -10.0),
      //           blurRadius: 30.0,
      //         )
      //       ]),
      // ),
      GestureDetector(
        child: Container(
          height: 70,
          width: 300,
          margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("App Permissions",
                    style: TextStyle(fontFamily: 'Rancho', fontSize: 20.0)),
              ]),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Color.fromRGBO(238, 181, 181, 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(206, 169, 169, 1),
                  offset: Offset(10.0, 10.0),
                  blurRadius: 30.0,
                  // spreadRadius: 1.0
                ),
                BoxShadow(
                  color: Color.fromRGBO(255, 229, 229, 1),
                  offset: Offset(-10.0, -10.0),
                  blurRadius: 30.0,
                  // spreadRadius: 1.0
                )
              ]),
        ),
        onTap: () async {
          openAppSettings();
        },
      ),
    ],
  );
}
