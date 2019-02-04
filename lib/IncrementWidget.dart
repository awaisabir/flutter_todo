import 'package:flutter/material.dart';

class IncrementWidget extends StatelessWidget {
  final onIncrement;

  IncrementWidget({this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: onIncrement,
            tooltip: 'Increment',
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