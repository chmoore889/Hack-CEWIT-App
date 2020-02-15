import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dog.dart';

void main() => runApp(MyApp());
double _counter = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Character Test'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  void _incrementCounter() {
    setState(() {
      if (_counter == 5){
        _counter = 0;
      }
      else{
        _counter++;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //DogAnimation1(),
            (_counter==0)?DogAnimation1():(_counter==1)? DogAnimation2():(_counter==2)? DogAnimation3():(_counter==3)?DogAnimation4():DogAnimation5(),

            Text(
              'Click the Button to Change Assets',
            ),
            Text(
              'Maturity Level $_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.code),
      ),
    );
  }
}

