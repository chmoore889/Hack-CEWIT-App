import 'package:flutter/material.dart'; 
import 'profile_ui.dart'; 

class Profile extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfilePage() 
      
    );
  }
}