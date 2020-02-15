
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30,10,30,0),
      child: CustomScrollView(
        slivers: <Widget>[
          /*SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 15,
                  child: LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.blue,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  )
                );
              },
            ),
          ),*/
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: FlatButton(
                    padding: EdgeInsets.all(6.0),
                    child: Column(
                      children: <Widget> [
                        index==0?Image.asset('assets/images/tile1.png'):index==1?Image.asset('assets/images/tile1.png'):index==2?Image.asset('assets/images/tile1.png'):Image.asset('assets/images/tile1.png'),
                        Text(index==0?"Unlocked":"Locked")
                      ]
                    ),
                    onPressed: () {

                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                  ),
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(251,243,217,1),
                    borderRadius: new BorderRadius.circular(15)
                  ),
                );
              },
              childCount: 4,
            ),
          )
        ],
      )
    );
  }
}