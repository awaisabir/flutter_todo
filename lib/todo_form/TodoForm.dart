import "package:flutter/material.dart";
import "dart:async";

import '../domain/Todo.dart';
import '../domain/TodoList.dart';

import '../TodoButton.dart';
import '../todo_list/TodoListGUI.dart';

class TodoForm extends StatefulWidget {
  final void Function(Todo todo) addTodo;
  final TodoList todoList;

  TodoForm({this.addTodo, this.todoList});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final double formWidth = 175.0;

  bool showForm = false;
  DateTime _date = new DateTime.now();

  String title;
  String description;


  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: this._date,
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2020)
    );

    if (picked != null && picked != this._date) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _showForm() {
    setState(() {
      this.showForm = !this.showForm;
    });
  }

  Widget _renderForm() {
    if (this.showForm) {

      return new Form(
        key: this._formKey,
        autovalidate: false,
        child: Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(20),
              child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                validator: (input) {
                  if (input.isEmpty) {
                    return 'You must enter a title for your to-do';
                  }
                },
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.title),
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                onSaved: (String title) {
                  this.setState(() {
                    this.title = title;
                  });
                },
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'You must enter a description for your to-do';
                  }
                },
                onSaved: (description) {
                  this.setState(() {
                    this.description = description;
                  });
                },
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.description),
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              )
            ),
            new Padding (
              padding: EdgeInsets.all(20),
              child: new GestureDetector(
                onTap: () {
                  this.selectDate(this.context);
                },
                child: new InputDecorator(
                  child: Text("${this._date.day.toString()}/${this._date.month.toString()}/${this._date.year.toString()}"),
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.date_range),
                    labelText: "Date",
                    border: OutlineInputBorder()
                  ),
                ),
              )
            )
          ],
        )
      );
    }

    return new Container();
  }

  Widget _renderSubmitButton() {
    if (this.showForm) {
      return RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            this._formKey.currentState.save();

            Todo todo = new Todo(
              title: this.title,
              description: this.description,
              date: this._date
            );
            widget.addTodo(todo);
          }
        },
        child: Text('Submit'),
      );
    }

    return new Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TodoButton(
          showForm: this.showForm,
          render: this._showForm,
        ),
        this._renderForm(),
        this._renderSubmitButton(),
        new TodoListGUI(todoList: widget.todoList)
      ]
    );
  }
}