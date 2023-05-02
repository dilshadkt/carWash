import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/home.dart';
import 'package:mymobile_car_wash/user/login.dart';
import 'package:mymobile_car_wash/user/signup.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return UserHome(useremail:"");
          }else{
            return UserLogin();
          }
        },
      ),
    );
  }
}
