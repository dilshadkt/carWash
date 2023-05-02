import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/components/see_all.dart';
import 'package:mymobile_car_wash/member/related-workers.dart';
import 'package:mymobile_car_wash/shop/shop_booking.dart';
import 'package:mymobile_car_wash/shop/worker-details.dart';
import 'package:mymobile_car_wash/user/user_details/user_profile.dart';

import '../shop/shop_home.dart';
import 'Worker request/request.dart';
import 'Worker request/sample_req.dart';
import 'member-profile.dart';

class MemberHome extends StatefulWidget {
  const MemberHome({Key? key}) : super(key: key);

  @override
  State<MemberHome> createState() => _MemberHomeState();
}

class _MemberHomeState extends State<MemberHome> {



  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    RelatedWorkers(),
    Sample(),
    WorkerDetails(),
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
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Request',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'info',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
