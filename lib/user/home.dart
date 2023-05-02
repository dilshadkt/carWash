import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/user_details/user_profile.dart';
import '../Get-user-data/get_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/see_all.dart';
import '../user/signup.dart';

import '../components/recommended-card.dart';
import '../components/service_card.dart';

final user = FirebaseAuth.instance.currentUser;
final db = FirebaseFirestore.instance;
final docRef = db.collection("signup").doc(user!.uid);

Future<String> getUserName() async {
  SharedPreferences pref=await SharedPreferences.getInstance();
  var gmail=pref.getString("gmail");
  print("sharede preference");
  print(gmail);
  String userName = "";
  final docRef = db.collection("signup").doc(gmail);
  await docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      userName = data['username'];
      print('$userName');
    },
    onError: (e) => print("Error"),
  );
  return userName;
}

class UserHome extends StatefulWidget {
  final String useremail;

  const UserHome({Key? key, required this.useremail}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  // var UserNAME='';
  // //fetch data from sigup page
  // @override
  // void initState() {
  //   // Execute some code when the widget is loaded
  //  Widget UserNAME= GetUserName('juman');
  //   super.initState();
  // }

  //shAared preference

  //shared preference upadte data

  void addToSharedPreferences(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString(key, value);
    });
  }

  String value = "";

  Future<String?> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Gmail = prefs.getString('gmail');

    // setState(() {
    //   value = counterValue ?? '';
    // });
  }

  @override
  void initState() {
    super.initState();
    // addToSharedPreferences('username', 'sahahl');
    getData();
  }

  late List<Map<String, dynamic>> usersList;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('signup').snapshots();

  @override
  Widget build(BuildContext context) {
    Widget UserNAME = GetUserName(widget.useremail);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text("hey Dilshad",style: TextStyle(fontSize: 17.6, color: Colors.grey)),
                FutureBuilder<String>(
                  future: getUserName(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text("Hey"+" "+snapshot.data!,style: TextStyle(fontSize: 17.6, color: Colors.grey));
                    } else if (snapshot.hasError) {
                      Text("${snapshot.error}");
                    }

                    return  Text("");
                  },
                ),
                //

                // Container(
                //   child:UserNAME,
                // ),
                IconButton(
                    onPressed: () {
                      print(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfile(
                                  useremail: widget.useremail,
                                )),
                      );
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What do you need\nhelp today?    ",
                    style: TextStyle(
                        fontSize: 21.37,
                        fontFamily: 'Poppins bold',
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SeeAll()),
                            );
                          },
                          icon: Icon(Icons.search_rounded)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[900]),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Super Saver Week",
                            style: TextStyle(
                                fontSize: 21.37,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "40% off on full car",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.37),
                          ),
                          Text(
                            "wash",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.37),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    "Grab offer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      Container(
                          child: Image(
                        image: AssetImage('assets/images/service.png'),
                        height: 110,
                        fit: BoxFit.cover,
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Best Services",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(color: Colors.red),
                  ))
            ]),
            ServiceCard(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended shop",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SeeAll()),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.red),
                        ))
                  ]),
            ),
            Expanded(child: RecomendCard())
          ],
        ),
      )),
    );
  }
}
