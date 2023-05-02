
import 'package:flutter/material.dart';

import '../shop/shop_home.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
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
      "description":
      "Good deals to wash your wheels through the month of March! Enjoy 10% off all services! The trusted name in automotive detailing in the Bryan College Station area"
    },
    {
      "image": "assets/images/car-wash-1619823__340.jpg",
      "shop": "Live Car Service",
      "location": "Perinthalmanna",
      "review": "4",
      "offer": "10%",
      "description":
      "A car wash, carwash, or auto wash is a facility used to clean the exterior, and in some cases the interior of cars. Car washes can be self-service, full-service (with attendants who wash the vehicle)"
    },
    {
      "image": "assets/images/cleaning-1837331__340.jpg",
      "shop": "Juman Car Service",
      "location": "Manjeri",
      "review": "5",
      "offer": "50%",
      "description":
      "machine washing, waxing, polishing, and interior cleaning. Some car wash shops also provide additional services such as tire shining, engine cleaning"
    },
    {
      "image": "assets/images/vw-1409153__340.jpg",
      "shop": "Arun Car Service",
      "location": "Vengara",
      "review": "2.4",
      "offer": "20%",
      "description":
      "The interior cleaning services offered by car wash shops usually involve vacuuming, wiping down surfaces, and cleaning upholstery and carpets. Some shops also offer specialized services such as leather conditioning and odor removal."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                    child: Text("Select Service",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                Text(
                  "Please Select Your Preferred",
                  style: TextStyle(color: Colors.grey),
                ),
                Text("Service Type", style: TextStyle(color: Colors.grey)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        // shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopHome(
                                      shopOwner: "",
                                      shopName: recmcard[index]["shop"],
                                      shopAdd: recmcard[index]["location"],
                                      shopDesc:  recmcard[index]["description"],
                                      shopImg:  recmcard[index]["image"], shopEmail: '',

                                    )),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 203, 202, 202),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image(
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                    image: AssetImage(recmcard[index]["image"]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        recmcard[index]["shop"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on_sharp),
                                            Text(
                                              recmcard[index]["location"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(recmcard[index]["review"]),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          recmcard[index]["offer"] + " off",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                        itemCount: recmcard.length),
                  ),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //         Container(
                //
                //         decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                //         child: TextButton(onPressed: (){}, child: Text("proceed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),)),
                //       ],
                // )
              ],
            ),
          )),
    );
  }
}
