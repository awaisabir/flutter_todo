import "package:flutter/material.dart";
import "dart:async";

import '../TodoButton.dart';
import '../domain/Todo.dart';

class TodoForm extends StatefulWidget {
  TodoForm({this.addTodo});

  final addTodo;

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final double formWidth = 175.0;

  bool showForm = false;
  DateTime _date = new DateTime.now();
  Todo todo = new Todo();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: this._date,
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2020)
    );

    if (picked != null && picked != this._date) {
      this.todo.setDate(picked);

      setState(() {
        _date = picked;
      });
    } else {
      this.todo.setDate(this._date);
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
                  this.todo.setTitle(title);
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
                  this.todo.setDescription(description);
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
            widget.addTodo(todo: this.todo);
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
        Text(
          'Create a Todo by clicking the + button below',
        ),
        TodoButton(
          showForm: this.showForm,
          render: this._showForm,
        ),
        this._renderForm(),
        this._renderSubmitButton()
      ]
    );
  }
}