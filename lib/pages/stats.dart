import 'package:flutter/material.dart'; 
import 'second_screen.dart'; 

class Stats extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SecondTab()
    );
  }
}