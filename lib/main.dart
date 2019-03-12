import 'package:flutter/material.dart';
import 'TodoButton.dart';
import 'TodoForm.dart';

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

  void _showForm() {
    setState(() {
      if (showForm == null) {
        showForm = false;
      } else {
        showForm = !showForm;
      }
    });
  }

  Widget _renderForm() {
    if (this.showForm) {
      return new CreateTodo();
    }

    return new Container();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        widthFactor: 20.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    this.showForm ? '' : 'Create a Todo by clicking the + button below',
                  ),
                  TodoButton(
                    showForm: this.showForm,
                    render: this._showForm,
                  ),
                  this._renderForm(),
                ],
              ),
            ],
          )
        )
      )
    );
  }
}
