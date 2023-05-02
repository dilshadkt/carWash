import 'package:flutter/material.dart';

import 'admine-home.dart';


class AdminePage extends StatefulWidget {
  const AdminePage({Key? key}) : super(key: key);

  @override
  State<AdminePage> createState() => _AdminePageState();
}

class _AdminePageState extends State<AdminePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   passwordConfirmed() {
    if (emailController.text.trim() ==
        "admine") {
      if(passwordController.text.trim()=="admine"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdmineHome()),
        );

      }


    }

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

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
                "Admin",
                style: TextStyle(
                    color: Colors.red, fontFamily: "Poppins bold", fontSize: 40),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: 300,
                            child: TextField(
                              controller: emailController,
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
                            controller: passwordController,
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
                    )
                  ],),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(color: Colors.red,),
              //   child: TextButton(onPressed: (){}, child:
              //   Text("Sign in" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              // )
              ElevatedButton(
                onPressed:(){
                  passwordConfirmed();
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),



            ],
          )),
    );
  }
}
