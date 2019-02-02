import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: 'This is my title being passed down',
        subTitle: 'This is the subtitle'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title, this.subTitle}) : super();

  final String title;
  final String subTitle;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: 
                Text(
                '${widget.subTitle}',
                style: TextStyle(
                  fontSize: 25.0,
                )
              ),
              margin: EdgeInsets.only(bottom: 25),
            ),
            Text(
              'The button has been pushed $_counter time(s)!',
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
