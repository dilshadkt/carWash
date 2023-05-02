import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/home.dart';
import 'package:mymobile_car_wash/user/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  //Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirPasswordController = TextEditingController();
  final _useNameControler = TextEditingController();

  var UserName;
  var UserEmail;

  @override
  void disposel() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirPasswordController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {

    if (passwordConfirmed()) {


      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        UserName = _useNameControler.text;
        UserEmail = _emailController.text;
        addUser();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHome(
                useremail: UserEmail,
              ),
            ));

        print(UserName);
      } catch (e) {
        // handle sign up errors
        print(e);
      }
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //addd login details to signUp collection

  CollectionReference users = FirebaseFirestore.instance.collection('signup');

  Future<void> addUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gmail", UserEmail);
    print("hello");
    return users
        .doc("${_emailController.text.trim()}")
        .set({
          'email': _emailController.text.trim(),
          'username': _useNameControler.text.trim(),
          'password': _passwordController.text.trim()
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SignUp",
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
                              controller: _useNameControler,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  prefixIcon: Icon(Icons.person)),
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: 300,
                            child: TextField(
                              // obscureText: true,
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
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          child: TextField(
                            // obscureText: true,
                            controller: _confirPasswordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Passsword",
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: signUp,

                      // () {},

                      //     () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ScreenHomeFirst()),
                      //   );
                      // },
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
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserLogin()),
                              );
                            },
                            child: Text("Login"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
