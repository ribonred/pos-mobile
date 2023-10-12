import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> tabItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home)),
      const BottomNavigationBarItem(icon: Icon(Icons.home)),
      const BottomNavigationBarItem(icon: Icon(Icons.home)),
    ];
    return BottomNavigationBar(items: tabItems);
  }
}
