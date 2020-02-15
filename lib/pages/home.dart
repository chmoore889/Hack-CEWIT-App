import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:line_awesome_icons/line_awesome_icons.dart';


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
    _pageController.dispose();
    super.dispose();
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  
  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 42, 86, 1),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 45.0),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      width: 350.0,
                      height: 135.0,
                      decoration: BoxDecoration ( 
                      borderRadius: BorderRadius.circular(25.0),  
                      color: Color.fromRGBO(205, 136, 63, 1), 
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromRGBO(251, 243, 217, 1),
                            offset: new Offset(5, -5),
                          )
                        ], 
                      ), 
                      alignment: Alignment.center,
                      duration: Duration(seconds: 3),
                      curve: Curves.fastOutSlowIn,  
                      child: Column (
                        children: <Widget> [
                          SizedBox(height: 15.0),
                          Text("Let's get to work!",
                            style: GoogleFonts.lato( 
                              color: Colors.white, 
                              fontSize: 35.0, 
                              fontWeight: FontWeight.w900
                            )
                          ),
                          SizedBox(height: 15.0),
                          FlatButton(  
                            color: Colors.white,
                            //borderRadius: BorderRadius.circular(25.0), 
                            child: Icon(Icons.add, size: 45.0, color: Color.fromRGBO(39, 42, 86, 1)), 
                            onPressed: () {
                              showPickerDateRange(context);
                            },  
                            shape: StadiumBorder(),
                          ),
                        ],
                      )
                    )
                  ]
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    pageChanged(index);
                  },
                  children: <Widget>[
                    Dashboard(),
                    Character(),
                    Stats(),
                    Profile(),
                  ],
                ),
                height: MediaQuery.of(context).size.height - 256.0,
                decoration: BoxDecoration(
                  color: Colors.white, // Color.fromRGBO(251, 243, 217, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                ),
              ),
            ]
          ),
        ],
      ),

      //////////////////////////////////////////
      //Bottom Bar Stuff////////////////////////
      //////////////////////////////////////////
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          bottomTapped(index);
          print(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home), activeColor: Color.fromRGBO(39, 42, 86, 1)),
          BottomNavyBarItem(title: Text('Accessories'), icon: Icon(Icons.pets), activeColor: Color.fromRGBO(39, 42, 86, 1)),
          BottomNavyBarItem(title: Text('Stats'), icon: Icon(Icons.insert_chart), activeColor: Color.fromRGBO(39, 42, 86, 1)),
          BottomNavyBarItem(title: Text('Profile'), icon: Icon(Icons.person), activeColor: Color.fromRGBO(39, 42, 86, 1)),
        ],
      ),
    );
  }

  void showPickerDateRange(BuildContext context) {
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