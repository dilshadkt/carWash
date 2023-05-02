import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/login.dart';

import '../signup.dart';



class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Container(
              height: 250,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person,size: 100,color: Colors.grey,),
                  Center(
                   child: Text("Member Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Text("Dilshad",style: TextStyle(fontSize: 17,height: 3)),
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  Text("hmydilshadkt@gmail.com",style: TextStyle(height: 3)),
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  Text("mobile",style: TextStyle(height: 3,color: Colors.grey)),
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.local_library,
                    color: Colors.grey,
                  ),
                  Text("address",style: TextStyle(height: 3,color: Colors.grey)),
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed:()  {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => UserLogin()),
                          );
                        },

                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.black,
                              height: 3
                          ),
                        )),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Divider()



          ],
        ),
      ),
    );
  }
}
