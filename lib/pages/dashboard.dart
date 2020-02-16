import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dog.dart';
import 'store_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            height: 115,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TyperAnimatedTextKit(
              speed: Duration(milliseconds:  50),
              text: [
                "You’ve got it made!",
                "Sensational!",
                "You’re doing fine.",
                "You’ve got your brain in gear today.", 
              ],
              textStyle: GoogleFonts.patrickHand(
                fontSize: 38
              ),
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.centerStart,
              pause: Duration(milliseconds:  5000),
            ),
          ),
          !Store.doesHaveHat()?((Store.getCount()==0)?DogAnimation1():(Store.getCount()==1)? DogAnimation2():(Store.getCount()==2)? DogAnimation3():DogAnimation4()):Hat(),
        ]
      )
    );
  }
}