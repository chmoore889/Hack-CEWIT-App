import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }
}