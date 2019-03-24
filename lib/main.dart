import 'package:flutter/material.dart';

import 'package:todo_app/todo_form/TodoForm.dart';
import 'Account.dart';
import 'BottomNavBar.dart';

import 'domain/Todo.dart';
import 'domain/TodoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showForm = false;
  int currentIndex = 0;

  TodoList todoList = new TodoList();

  void _setCurrentIndex(int currentIndex) {
    setState(() {
      this.currentIndex = currentIndex;
    });
  }

  void addTodo(Todo todo) {
    setState(() {
      this.todoList.addTodo(todo);
    });

  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      TodoForm(
          addTodo: this.addTodo,
          todoList: this.todoList,
      ),
      Account()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('To-do App'),
      ),
      bottomNavigationBar: BottomNavBar(
        setCurrentIndex: this._setCurrentIndex, 
        currentIndex: this.currentIndex,
      ),
      body: Center(
        widthFactor: 20.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              pages[this.currentIndex]
            ]
          )
        )
      )
    );
  }
}
