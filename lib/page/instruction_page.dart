import 'package:flutter/material.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final _kBottonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Tab1'),
      const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Tab2'),
      const BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Tab3'),
    ];
    assert(_kTabPages.length == _kBottonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}