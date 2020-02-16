import 'package:flutter/material.dart';
import 'store_list.dart'; 
class Character extends StatefulWidget {
  @override
  _Character createState() => _Character();
}

class _Character extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Store()
    );
  }
}