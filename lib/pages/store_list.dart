import 'FadeAnimation.dart';
import 'package:flutter/material.dart'; 

class Store extends StatefulWidget {
  static bool doesHaveHat(){
    return _Store.doesHaveHat();
  }
  static int getCount(){
    return _Store.getCount();
  }
  _Store createState() => _Store();
}
class _Store extends State<Store> {
  static int _counter = 0;
  static bool hasHat = false;

  static int getCount(){
    return _counter;
  }

  static bool doesHaveHat(){
    return hasHat;
  }

  static void incrementCounter(){
    _counter++;
    if(_counter>=4){
      _counter = 0;
    }
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                value: 0.69,
                backgroundColor: Color.fromRGBO(138, 145, 255, 0.6),
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(39, 42, 86, 1))
              ),
              SizedBox(height: 15,),
              Text("182 points until next level", style: TextStyle(color: Color.fromRGBO(39, 42, 86, 1)),),
              SizedBox(height: 20,),
              FadeAnimation(0, makeUnlockedItem(image: 'assets/images/one.png', tag: 'hat', context: context, level: 2, title: "Cowboy Hat", subtitle: "A throwback to the wild west.")),
              FadeAnimation(0, makeLockedItem(image: 'assets/images/two.png', tag: 'unnknown1', context: context, level: 5)),
              FadeAnimation(0, makeLockedItem(image: 'assets/images/three.png', tag: 'unnknown2', context: context, level:11)),
              
              SizedBox(height: 30,),
              FlatButton(onPressed: incrementCounter, child: Text("Next Level"))
            ],
          ),
        ),
      ),
    );
  }

  Widget makeUnlockedItem({image, tag, context, level, title, subtitle}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          setState(() {
            hasHat=true;
          });
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1, Text("$title", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        FadeAnimation(1.1, Text("$subtitle", style: TextStyle(color: Colors.white, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1.2, Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hasHat?Colors.green:Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 20,),
                    ),
                  ))
                ],
              ),
              FadeAnimation(1.2, Text("Level $level", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),              
            ],
          ),
        ),
      ),
    );
  } 
  Widget makeLockedItem({image, tag, context, level}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1, Text("????", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        FadeAnimation(1.1, Text("Grow your pet to unlock.", style: TextStyle(color: Colors.white, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1.2, Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.lock, size: 20,),
                    ),
                  ))
                ],
              ),
              FadeAnimation(1.2, Text("Level $level", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),              
            ],
          ),
        ),
      ),
    );
  } 
} 
