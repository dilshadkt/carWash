import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/main_page.dart';
import 'package:mymobile_car_wash/splash.dart';
import 'package:mymobile_car_wash/user/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mymobile_car_wash/user/user_details/user_profile.dart';



Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue,fontFamily: 'Poppins'),
      home: SplashScreen(),
    );
  }
}
