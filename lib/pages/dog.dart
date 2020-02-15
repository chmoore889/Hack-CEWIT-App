import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class DogAnimation1 extends StatefulWidget {
  @override
  _DogAnimation1 createState() => _DogAnimation1();
}


class _DogAnimation1 extends State<DogAnimation1> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/level1.flr",
        animation: "animation1",
        fit:BoxFit.contain,
      )
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////

class DogAnimation2 extends StatefulWidget {
  @override
  _DogAnimation2 createState() => _DogAnimation2();
}


class _DogAnimation2 extends State<DogAnimation2> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/level2.flr",
        animation: "animation2",
        fit:BoxFit.contain,
      )
    );
  }
}

///////////////////////////////////////////////////////////

class DogAnimation3 extends StatefulWidget {
  @override
  _DogAnimation3 createState() => _DogAnimation3();
}



class _DogAnimation3 extends State<DogAnimation3> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/level3.flr",
        animation: "animation3",
        fit:BoxFit.contain,
      )
    );
  }
}

////////////////////////////////////////////////////////////////////////////

class DogAnimation4 extends StatefulWidget {
  @override
  _DogAnimation4 createState() => _DogAnimation4();
}


class _DogAnimation4 extends State<DogAnimation4> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/level4.flr",
        animation: "animation4",
        fit:BoxFit.contain,
      )
    );
  }
}

/////////////////////////////////////////////////////////////////////////

class DogAnimation5 extends StatefulWidget {
  @override
  _DogAnimation5 createState() => _DogAnimation5();
}


class _DogAnimation5 extends State<DogAnimation5> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/level4.flr",
        animation: "animation4",
        fit:BoxFit.contain,
      )
    );
  }
}

//////////////////////////////////////////////////////////////////////////

class DogAnimation6 extends StatefulWidget {
  @override
  _DogAnimation6 createState() => _DogAnimation6();
}


class _DogAnimation6 extends State<DogAnimation6> { 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:FlareActor(
        "assets/hat.flr",
        animation: "hatanimation",
        fit:BoxFit.contain,
      )
    );
  }
}

/////////////////////////////////////////////////////////////////////////