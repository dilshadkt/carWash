import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/member/member-profile.dart';
import 'package:mymobile_car_wash/user/user_details/user_profile.dart';

import 'Admine.dart';

class AdmineHome extends StatefulWidget {
  const AdmineHome({Key? key}) : super(key: key);

  @override
  State<AdmineHome> createState() => _AdmineHomeState();
}

class _AdmineHomeState extends State<AdmineHome> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    Adminpage(),
   MemberProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Request',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.green,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
