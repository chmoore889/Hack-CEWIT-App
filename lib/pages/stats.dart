import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
    );
  }
}