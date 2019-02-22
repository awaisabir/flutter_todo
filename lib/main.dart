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
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0x552B2B2B),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: CustomPaint(
                  // painter: TabIndicationPainter(pageController: _pageController),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () { print('Hello'); },
                          child: Text(
                            "Existing",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.0,
                                fontFamily: "WorkSansSemiBold"),
                          ),
                        ),
                      ),
                      //Container(height: 33.0, width: 1.0, color: Colors.white),
                      Expanded(
                        child: FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () { print('Hello'); },
                          child: Text(
                            "New",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 16.0,
                                fontFamily: "WorkSansSemiBold"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 500.0,
                child: PageView(
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
                    Container(
                      color: Colors.red,
                      child: Text('This will be the list of todos')
                    )
                  ],
                )
              )
            ]
          )
        )
      ),
    );
  }
}
