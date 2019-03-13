import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({this.currentIndex, this.setCurrentIndex});

  final int currentIndex;
  final setCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        this.setCurrentIndex(index);
      },
      currentIndex: this.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.list),
          title: new Text('Todos'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.person),
          title: new Text('Account'),
        )
      ],
    );
  }
}