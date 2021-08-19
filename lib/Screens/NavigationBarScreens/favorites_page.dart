import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(186, 212, 227, 1),
        toolbarHeight: 70.0,
        leadingWidth: 60.0,

        leading: Container(
          margin: EdgeInsets.only(left: 10.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 147, 147, 1),
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
        title: Center(
          child: Text(
            "Fun Games",
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
                color: Color.fromRGBO(246, 147, 147, 1),
                shape: BoxShape.circle),
            child: Icon(
              Icons.favorite,
              color: Color.fromRGBO(242, 23, 23, 1),
              size: 25.0,
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Fun Games",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30.0,
                  fontFamily: 'Ramaraja')),
          SizedBox(
            height: 10.0,
          ),
          Text("Coming Soon...",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30.0,
                  fontFamily: 'Ramaraja')),
          SizedBox(
            height: 10.0,
          ),
        ],
      )),
    );
  }
}
