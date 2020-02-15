import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile.dart';
import 'dashboard.dart';
import 'character.dart';
import 'stats.dart';
import 'dart:convert';
import 'pickerData.dart';

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  int minutes = 0;
  int hours = 0;

  PageController _pageController;

  int _currentIndex = 0;
  Widget currentScreen = Dashboard();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  
  @override
  void dispose() {
    //_pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 47, 76, 1),
      body: Stack(
        children: <Widget>[
          ListView(children: <Widget>[
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Row(
                children: <Widget>[
                  AnimatedContainer(
                    width: 385.0,
                    height: 100.0,
                   decoration: BoxDecoration ( 
                     color: Colors.blue, 
                     borderRadius: BorderRadius.circular(25.0)
                   ),
                    alignment: Alignment.center,
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn, 
                    // child: FlutterLogo(size: 75),
                  ),
                  /*Text("Let's get working now.",
                  style: GoogleFonts.lora(
                      fontWeight: FontWeight.w700, 
                      color: Colors.white,
                      fontSize: 30.0)), */
                ],
              ),
            ),
            /*Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Row(
            children: <Widget>[ 
              FlatButton ( 
                child: Icon(Icons.add), 
                color: Color.fromRGBO(184,184,209,1), 
                onPressed: () {showPickerDateRange(context);},// this should pull up the timer
                shape: StadiumBorder(),
          )
              ,
            ], 
          ), 
        ),*/

            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white, // Color.fromRGBO(251, 243, 217, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
            ),
          ]),
          PageView(
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Dashboard(),
              Character(),
              Stats(),
              Profile(),
          ],
          )
        ],
      ),

      //////////////////////////////////////////
      //Bottom Bar Stuff////////////////////////
      //////////////////////////////////////////
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Dashboard'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Character'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
            title: Text('Stats'),
            icon: Icon(Icons.chat_bubble)
          ),
          BottomNavyBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }

  showPickerDateRange(BuildContext context) {
    Picker timeSel = new Picker(
        hideHeader: true,
        adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData),
          isArray: true,
        ),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
          hours = value[0];
          minutes = value[1];
          print(hours);
          print(minutes);
        });

    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
            timeSel.onConfirm(timeSel, timeSel.selecteds);
          },
          child: new Text(PickerLocalizations.of(context).confirmText))
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text("Set Timer"),
          actions: actions,
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Hours:                 Minutes:"),
                timeSel.makePicker(),
              ],
            ),
          ),
        );
      }
    );
  }
}
