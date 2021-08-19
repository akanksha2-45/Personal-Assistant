import 'package:flutter/material.dart';
import 'package:new_destek_sorted/Screens/Features/FeaturesAppBar.dart';
import 'package:new_destek_sorted/Screens/Features/MyFlexibleAppBar.dart';

class Features extends StatefulWidget {
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color.fromRGBO(226, 177, 177, 1),
          title: FeaturesAppbar(),
          pinned: true,
          floating: false,
          automaticallyImplyLeading: false,
          expandedHeight: 260.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Features",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Rancho',
                ),
              ),
            ),
            background: MyFlexibleAppBar(),
          ),
        ),
        SliverList(

          delegate: SliverChildListDelegate(
            <Widget>[
              firstFeature(),
              secondFeature(),
              thirdFeature(),
              fourthFeature(),
              fifthFeature(),
            ],
          ),
        ),
      ]),
    );
  }
}

Widget firstFeature() {
  return Container(
    height: 170.0,
    width: 150.0,
    decoration: BoxDecoration(
      color: Color.fromRGBO(244, 211, 209, 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 3.0), //(x,y)
            blurRadius: 10.0,
            spreadRadius: 2.0),
      ],
    ),
    margin: EdgeInsets.only(top: 30.0, bottom: 20.0, left: 10.0, right: 10.0),
    padding: EdgeInsets.all(5.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "assets/images/date_and_time.png",
            height: 100.0,
            width: 100.0,
          ),
          // Image(image: AssetImage("assets/images/web_search.png",),
          // ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                Container(
                  width: 300.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(141, 140, 140, 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Text(
                      "Speak Aloud",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 238, 237, 1),
                        fontSize: 28.0,
                        fontFamily: 'Ramaraja',
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                new FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check it out!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            // fontFamily: '',
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.arrow_right_alt_outlined,
                            color: Colors.black)
                      ],
                    ),
                    onPressed: () {})
              ]))
        ]),
  );
}

Widget secondFeature() {
  return Container(
    height: 170.0,
    width: 300,
    decoration: BoxDecoration(
      color: Color.fromRGBO(187, 227, 186, 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 3.0), //(x,y)
            blurRadius: 10.0,
            spreadRadius: 2.0),
      ],
    ),
    margin: EdgeInsets.only(top: 5.0, bottom: 20.0, left: 10.0, right: 10.0),
    padding: EdgeInsets.all(5.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset(
        "assets/images/get_location.png",
        height: 100.0,
        width: 100.0,
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Container(
              width: 300.0,
                  height: 90.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 140, 140, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "Translator",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(237, 255, 239, 1),
                    fontSize: 28.0,
                    height: 1.2,
                    fontFamily: 'Ramaraja',
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            new FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check it out!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        // fontFamily: '',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.arrow_right_alt_outlined, color: Colors.black)
                  ],
                ),
                onPressed: () {})
          ]))
    ]),
  );
}

Widget thirdFeature() {
  return Container(
    height: 170.0,
    width: 300.0,
    decoration: BoxDecoration(
      color: Color.fromRGBO(186, 212, 227, 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 3.0), //(x,y)
            blurRadius: 10.0,
            spreadRadius: 2.0),
      ],
    ),
    margin: EdgeInsets.only(top: 5.0, bottom: 20.0, left: 10.0, right: 10.0),
    padding: EdgeInsets.all(5.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset(
        "assets/images/web_search.png",
        height: 100.0,
        width: 100.0,
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Container(
              width: 300.0,
                  height: 90.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 140, 140, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "URL Opener",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(218, 240, 253, 1),
                      fontSize: 28.0,
                      height: 1.2,
                      fontFamily: 'Ramaraja'),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            new FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check it out!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        // fontFamily: '',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.arrow_right_alt_outlined, color: Colors.black)
                  ],
                ),
                onPressed: () {})
          ]))
    ]),
  );
}

Widget fourthFeature() {
  return Container(
    height: 170.0,
    width: 300.0,
    decoration: BoxDecoration(
      color: Color.fromRGBO(233, 181, 228, 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 3.0), //(x,y)
            blurRadius: 10.0,
            spreadRadius: 2.0),
      ],
    ),
    margin: EdgeInsets.only(top: 5.0, bottom: 20.0, left: 10.0, right: 10.0),
    padding: EdgeInsets.all(5.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset(
        "assets/images/logo.png",
        height: 100.0,
        width: 100.0,
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Container(
              width: 300.0,
                  height: 90.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 140, 140, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "this is the fourth feature",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(251, 211, 249, 1),
                      fontSize: 28.0,
                      height: 1.2,
                      fontFamily: 'Ramaraja'),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            new FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check it out!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        // fontFamily: '',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.arrow_right_alt_outlined, color: Colors.black)
                  ],
                ),
                onPressed: () {})
          ]))
    ]),
  );
}

Widget fifthFeature() {
  return Container(
    height: 170.0,
    width: 300.0,
    decoration: BoxDecoration(
      // boxShadow: ,
      color: Color.fromRGBO(227, 216, 186, 1),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 3.0), //(x,y)
            blurRadius: 10.0,
            spreadRadius: 2.0),
      ],
    ),
    margin: EdgeInsets.only(top: 5.0, bottom: 20.0, left: 10.0, right: 10.0),
    padding: EdgeInsets.all(5.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset(
        "assets/images/logo.png",
        height: 100.0,
        width: 100.0,
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Container(
              width: 300.0,
                  height: 90.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(141, 140, 140, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "This is the fifth feature",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(246, 246, 204, 1),
                      fontSize: 28.0,
                      height: 1.2,
                      fontFamily: 'Ramaraja'),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            new FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check it out!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        // fontFamily: '',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.arrow_right_alt_outlined, color: Colors.black)
                  ],
                ),
                onPressed: () {})
          ]))
    ]),
  );
}
