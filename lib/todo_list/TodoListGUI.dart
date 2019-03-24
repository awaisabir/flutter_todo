import 'package:flutter/material.dart';

import 'TodoListItem.dart';

import '../domain/TodoList.dart';
import '../domain/Todo.dart';

class TodoListGUI extends StatelessWidget {
  final TodoList todoList;

  TodoListGUI({this.todoList});

  List<Widget> generateList() {
    List<TodoListItem> todoListItems = new List<TodoListItem>();

    if (this.todoList.getTodos().length == 0) {
      return [new Container()];
    }

    for (Todo todo in todoList.getTodos()) {
      TodoListItem card = new TodoListItem(todo: todo);
      todoListItems.add(card);
    }

    return todoListItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.generateList()
    );
  }
}