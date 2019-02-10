import 'package:flutter/material.dart';

class IncrementWidget extends StatelessWidget {
  final showForm;

  IncrementWidget({this.showForm});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: this.showForm,
            tooltip: 'Add Todo',
            child: Icon(Icons.add),
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