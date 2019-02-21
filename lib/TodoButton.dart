import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final render;
  final bool showForm;

  TodoButton({this.render, this.showForm});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: this.render,
            tooltip: this.showForm ? 'Cancel' : 'Add Todo',
            child: this.showForm ? Icon(Icons.remove) : Icon(Icons.add),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      margin: EdgeInsets.only(
        top: 20
      ),
    );
  }
}