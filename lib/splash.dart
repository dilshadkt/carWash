import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 3 seconds before navigating to the next screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.asset("assets/images/spalsh.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "CAR WASH",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
