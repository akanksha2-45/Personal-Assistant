import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class VoiceSwitch extends StatefulWidget {
  @override
  VoiceSwitchState createState() => VoiceSwitchState();
}

// FlutterTts flutterTts = FlutterTts();

var voiceChoice = "Female";
// setVoice(String text){
//   if( voiceChoice == "Male"){
//        flutterTts.setVoice("en-us-x-sfg#male_1-local");
//        flutterTts.setLanguage("en-US");
//        flutterTts.setPitch(1);
//        flutterTts.setVolume(1.0);
//       flutterTts.speak(text);
    
//   }
//   else{
//      flutterTts.setVoice("en-us-x-sfg#female_1-local");
//      flutterTts.setLanguage("en-US");
//      flutterTts.setPitch(1);
//        flutterTts.setVolume(1.0);
//       flutterTts.speak(text);
//     }
//   }


class VoiceSwitchState extends State<VoiceSwitch> {
  static bool isSwitched = false;
  static var textValue = 'Female Voice';
  // String voice='';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Male Voice';
        voiceChoice = "Male";
      });
      print('Male Voice');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Female Voice';
        voiceChoice = "Female";
      });
      print('Female Voice');
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
