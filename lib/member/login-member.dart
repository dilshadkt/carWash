import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'member-details.dart';
import 'member_home.dart';


class MemberLogin extends StatefulWidget {
  const MemberLogin({Key? key}) : super(key: key);

  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  final _memberEmailController = TextEditingController();
  final _memberPasswordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _memberEmailController.text.trim(),
        password: _memberPasswordController.text.trim());
    Navigator.pushReplacementNamed(context, '/member/member-details');
  }

  @override
  void disposel(){
    _memberEmailController.dispose();
    _memberPasswordController.dispose();
    super.dispose();

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
                "Member Login",
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
                              width: 330,
                              child: TextField(
                                controller: _memberEmailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 330,
                            child: TextField(
                              controller: _memberPasswordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  prefixIcon: Icon(Icons.lock)),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(
                        onPressed:(){signIn;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemberHome()),
                        );},
                        child: Text(
                          "Sign in",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                      builder: (context) => MemberdDetails()),
                                );
                              },
                              child: Text("SingUp"))
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ],
          )),
    );

  }
}
