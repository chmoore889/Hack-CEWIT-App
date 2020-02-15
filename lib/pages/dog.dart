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
        "assets/dog_1.flr",
        animation: "dog_1",
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
        "assets/dog_2.flr",
        animation: "dog_2",
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
        "assets/dog_3.flr",
        animation: "dog_3",
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
        "assets/dog_4.flr",
        animation: "dog_4",
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
        "assets/dog_5.flr",
        animation: "dog_5",
        fit:BoxFit.contain,
      )
    );
  }
}
