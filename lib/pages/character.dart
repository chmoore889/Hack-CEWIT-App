import 'package:flutter/material.dart';
import 'store_list.dart'; 
class Character extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomePage()
    );
  }
}