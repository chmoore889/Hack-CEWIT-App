import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: FlareActor(
        "assets/dog.flr",
        animation:"Untitled",
        fit: BoxFit.contain,
      ),
    );
  }
}