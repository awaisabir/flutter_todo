import 'package:flutter/material.dart';
import 'TodoForm.dart';
import 'Account.dart';
import 'BottomNavBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Todo App',
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
  bool showForm = false;
  int currentIndex = 0;

  final pages = [
    TodoForm(),
    Account()
  ];

  void _setCurrentIndex(int currentIndex) {
    setState(() {
      this.currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavBar(
        setCurrentIndex: this._setCurrentIndex, 
        currentIndex: this.currentIndex
      ),
      body: Center(
        widthFactor: 20.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              this.pages[this.currentIndex]
            ]
          )
        )
      )
    );
  }
}
