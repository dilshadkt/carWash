import 'package:flutter/material.dart';

import 'booking-request.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request>with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this,length: 2, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          BookingRequest(),
          BookingRequest(),

        ],

      ),);
  }
}
