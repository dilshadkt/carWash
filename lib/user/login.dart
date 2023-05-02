import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/home.dart';
import 'package:mymobile_car_wash/user/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admine/Admine.dart';
import '../Admine/admine-home.dart';
import '../Admine/admine-login.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  //Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Signin function
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gmail", _emailController.text.trim());

    // Navigator.pushReplacementNamed(context, '/user/home');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              UserHome(useremail: _emailController.text.trim())),
    );
    print(_emailController.text.trim());
  }

  @override
  void disposel() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.red, fontFamily: "Poppins bold", fontSize: 40),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: 300,
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: signIn,
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserSignUp()),
                              );
                            },
                            child: Text("SignUp"))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AdminePage()),
                                );
                              },
                              child: Text(
                                "Admin",
                                style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 4),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
