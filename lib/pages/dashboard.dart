import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dog.dart';
import 'store_list.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            height: 93,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Home.timerRunning()?TyperAnimatedTextKit(
              speed: Duration(milliseconds:  50),
              text: [
                "Do or do not, there is no try.",
                "Keep going. You're doing great!",
                "Yes, you can!",
                "Push yourself because no one else will.", 
                "If you can dream it, you can do it."
              ],
              textStyle: GoogleFonts.lato(
                fontSize: 38
              ),
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.centerStart,
              pause: Duration(milliseconds:  6000),
            ):null
          ),
          !Store.doesHaveHat()?((Store.getCount()==0)?DogAnimation1():(Store.getCount()==1)? DogAnimation2():(Store.getCount()==2)? DogAnimation3():DogAnimation4()):Hat(),
        ]
      )
    );
  }
}