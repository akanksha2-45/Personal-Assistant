import 'package:flutter/material.dart';

class FeaturesAppbar extends StatelessWidget {
  const FeaturesAppbar();
  final double barHeight = 66.0;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(208, 208, 208, 0.80),
                shape: BoxShape.circle),
            // child: IconButton(Icons.keyboard_arrow_left_rounded, color: Colors.black,size: 40.0,)
            child: IconButton(
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
        ),
        // Container(
        //   padding: EdgeInsets.all(10.0),
        //   child: Text(
        //     "Features",
        //     style: TextStyle(
        //       color:Colors.black,
        //       fontFamily:'Poly' ,
        //     )
        //   ),
        // ),
      ]),
    );
  }
}
