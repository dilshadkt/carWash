
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Get-user-data/collect-data.dart';
import '../shop/shop_home.dart';
import '../user/home.dart';

// Future<String> getUserName() async {
//   SharedPreferences pref=await SharedPreferences.getInstance();
//   var gmail=pref.getString("gmail");
//   print("sharede preference");
//   print(gmail);
//   String shopName = "";
//   String shopPlace = "";
//
//   final docRef = db.collection("member").doc();
//   await docRef.get().then(
//         (DocumentSnapshot doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       shopName = data['shopname'];
//       shopPlace = data['place'];
//       // print('$userName');
//     },
//     onError: (e) => print("Error"),
//   );
//   return shopName;
// }

class RecomendCard extends StatefulWidget {
  RecomendCard({super.key});

  @override
  State<RecomendCard> createState() => _RecomendCardState();
}

class _RecomendCardState extends State<RecomendCard> {
  List<Map<String, dynamic>> recmcard = [
    {
      "image": "assets/images/shopy.webp",
      "shop": "Cube Car Service",
      "location": "Kondotty",
      "review": "5.5",
      "offer": "30%",
      "description":
      "Keep Your Car Clean Using State of the Art Equipment in a Clean and Safe Environment. Wash Includes Free Vacuums, Glass Cleaner, Degreaser, Mat Cleaners, & Air Fresheners",
    },
    {
      "image": "assets/images/auto-2875254__340.jpg",
      "shop": "E Car Service",
      "location": "Malappuram",
      "review": "2.5",
      "offer": "40%",
      "description":"Good deals to wash your wheels through the month of March! Enjoy 10% off all services! The trusted name in automotive detailing in the Bryan College Station area"
    },
    {
      "image": "assets/images/car-wash-1619823__340.jpg",
      "shop": "Live Car Service",
      "location": "Perinthalmanna",
      "review": "4",
      "offer": "10%",
      "description":"A car wash, carwash, or auto wash is a facility used to clean the exterior, and in some cases the interior of cars. Car washes can be self-service, full-service (with attendants who wash the vehicle)"

    },
    {
      "image": "assets/images/cleaning-1837331__340.jpg",
      "shop": "Juman Car Service",
      "location": "Manjeri",
      "review": "5",
      "offer": "50%",
      "description":"machine washing, waxing, polishing, and interior cleaning. Some car wash shops also provide additional services such as tire shining, engine cleaning"
    },
    {
      "image": "assets/images/vw-1409153__340.jpg",
      "shop": "Arun Car Service",
      "location": "Vengara",
      "review": "2.4",
      "offer": "20%",
      "description":"The interior cleaning services offered by car wash shops usually involve vacuuming, wiping down surfaces, and cleaning upholstery and carpets. Some shops also offer specialized services such as leather conditioning and odor removal."

    }
  ];

  @override
  Widget build(BuildContext context) {
     return UserInformation();
  }
}
