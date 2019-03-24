import 'package:flutter/material.dart';
import '../domain/Todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(this.todo.getId()),
              Text(this.todo.getTitle()),
              Text(this.todo.getDescription()),
              Text(this.todo.getDate())
            ],
          )
      )
    );
  }
}