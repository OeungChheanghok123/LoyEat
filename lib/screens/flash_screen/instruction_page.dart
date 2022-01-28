import 'package:flutter/material.dart';
import 'package:loy_eat/widgets/layout_widget/color.dart';
import 'package:loy_eat/screens/main_screen/account_page.dart';
import 'package:loy_eat/screens/main_screen/home_page.dart';
import 'package:loy_eat/screens/main_screen/order_page.dart';
import 'package:loy_eat/screens/main_screen/report_page.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {

  int _currentTabIndex = 0;

  final _listTabPages = <Widget>[
    const HomePage(),
    const ReportPage(),
    const OrderPage(),
    const AccountPage(),
  ];

  final _pageBottonNavBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Report'),
    const BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Order'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];


  @override
  Widget build(BuildContext context) {

    assert(_listTabPages.length == _pageBottonNavBarItems.length);

    return Scaffold(
      body: _listTabPages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _pageBottonNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: rabbit,
        backgroundColor: white,
        elevation: 0,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),
    );
  }
}