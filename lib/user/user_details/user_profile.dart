import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/Get-user-data/get_user_data.dart';
import 'package:mymobile_car_wash/member/member-indroduction.dart';
import 'package:mymobile_car_wash/user/login.dart';
import 'package:mymobile_car_wash/user/user_details/personal_info.dart';

import '../../member/login-member.dart';

class UserProfile extends StatefulWidget {

  final String useremail;
  const UserProfile({Key? key,required this.useremail,}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 250,

            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                      AssetImage("assets/images/profilelogo.png"),
                    ),
                  ),
                ),
                // GetUserName(widget.useremail)


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
                Expanded(
                  child: TextButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalDetails()),
                        );
                      },
                      child: Text(
                        "Personal informaion",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Icon(
                  Icons.arrow_forward_ios,
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
                  Icons.notifications,
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Notification",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Icon(
                  Icons.arrow_forward_ios,
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
                  Icons.person_add_alt_1_rounded,
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MemberLogin()),
                        );
                      },
                      child: Text(
                        "Become a member",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 10,
                right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.history,
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "History",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Icon(
                  Icons.arrow_forward_ios,
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
                      onPressed:() async {
                       await  FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => UserLogin()),
                        );
                      },

                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.black),
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
        ],),
      ),
    );
  }
}
