import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'profile.dart';
import 'dashboard.dart';
import 'character.dart';
import 'stats.dart';
import 'dart:convert';
import 'pickerData.dart';

class Home extends StatefulWidget  {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {

  int minutes = 0;
  int hours = 0;

  int currentTab = 0;
  Widget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,193,69,1),
      body: PageStorage(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(height: 100.0),
                Container(
                  height: MediaQuery.of(context).size.height - 185.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                ),
              ]
            ),
            currentScreen //Draws current page based on 
          ],
        ),
        bucket: bucket,
      ),
      
      //////////////////////////////////////////
      //Bottom Bar Stuff////////////////////////
      //////////////////////////////////////////
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {showPickerDateRange(context);},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    shape: new CircleBorder(),
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Dashboard(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                        print(currentScreen);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: new CircleBorder(),
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Character(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                        print(currentScreen);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    shape: new CircleBorder(),
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Stats(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                        print(currentScreen);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: new CircleBorder(),
                    minWidth: 75,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                        print(currentScreen);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.supervisor_account,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
      }
    );

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
        child: new Text(PickerLocalizations.of(context).confirmText)
      )
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