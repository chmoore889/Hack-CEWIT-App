import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wakelock/wakelock.dart';

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

class HomePage extends State<Home> with WidgetsBindingObserver{
  static int minutes = 0;
  static int hours = 0;

  var formatter = new NumberFormat("00", "en_US");

  static int totalSeconds = minutes*60+hours*3600;

  int remSeconds = 0;
  int remMinutes = 0;
  int remHours = 0;

  PageController _pageController;
  Timer _timer;

  int _currentIndex = 0;
  Widget currentScreen = Dashboard();

  void startTimer() {
    totalSeconds = minutes*60+hours*3600;
    Wakelock.enable();
    _timer.cancel();
    
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) => setState(() {
      if (totalSeconds < 1) {
        timer.cancel();
        Wakelock.disable();
        //timerEnd();
      }
      else {
        totalSeconds = totalSeconds - 1;
        remHours = (totalSeconds/3600).floor();
        remMinutes = ((totalSeconds - remHours*3600)/60).floor();
        remSeconds = totalSeconds - remMinutes*60 - remHours*3600;
        print(totalSeconds);
      }
    }));
  }

  void timerForceEnd() {
    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
          onPressed: () {
            setState((){
              Navigator.pop(context);
              _timer.cancel();
              remMinutes = 0;
              remSeconds = 0;
              remHours = 0;
              Wakelock.disable();
            });
          },
          child: new Text(PickerLocalizations.of(context).confirmText))
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text("Confirm"),
          actions: actions,
          content: Container(
            child: Text("Are you sure you want to end your session?\n\nAll progress will be lost.")
          ),
        );
      }
    );
  }

  void consequences(){
    _timer.cancel();
    remMinutes = 0;
    remSeconds = 0;
    remHours = 0;
    Wakelock.disable();

    print("you're a consequence");

    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            setState((){
              Navigator.pop(context);
            });
          },
          child: new Text(PickerLocalizations.of(context).confirmText))
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text("Consequences"),
          actions: actions,
          content: Container(
            child: Text("U suck at this game")
          ),
        );
      }
    );
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused:
        print('paused state');
        break;
      case AppLifecycleState.resumed:
        print('resumed state');
        break;
      case AppLifecycleState.inactive:
        print('inactive state');
        consequences();
        break;
      case AppLifecycleState.detached: 
        print("detached state"); 
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
    if(_timer == null) {
      _timer = Timer.periodic(Duration(seconds:0), null);
      print("null init");
      _timer.cancel();
    }
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
                      width: 300.0,
                      height: 150.0,
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
                          SizedBox(height: 20.0),
                          Text(!_timer.isActive ? ("Let's get to work!") : (formatter.format(remHours) + ":" + formatter.format(remMinutes) + ":" + formatter.format(remSeconds)),
                            style: GoogleFonts.lato( 
                              color: Colors.white, 
                              fontSize: !_timer.isActive ? 35 : 50.0, 
                              fontWeight: FontWeight.w900
                            )
                          ),
                          SizedBox(height: !_timer.isActive ? 20 : 10),
                          FlatButton(
                            child: !_timer.isActive ? Icon(Icons.add, size: 50, color: Color.fromRGBO(39, 42, 86, 1)) : Text("Stop"),
                            color: Colors.white,
                            onPressed: () {
                              !_timer.isActive ? showPickerDateRange(context) : timerForceEnd();
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
                height: MediaQuery.of(context).size.height - 271.0,
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
          startTimer();
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
