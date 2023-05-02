import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mymobile_car_wash/shop/worker-details.dart';

import 'booking_details.dart';

class ShopBooking extends StatefulWidget {
  final String OwnerName;
  final String ShopName;
  final String shopPlace;
  final String OwnerEmail;

  const ShopBooking(
      {Key? key,
      required this.OwnerName,
      required this.shopPlace,
      required this.ShopName,
      required this.OwnerEmail})
      : super(key: key);

  @override
  State<ShopBooking> createState() => _ShopBookingState();
}

class _ShopBookingState extends State<ShopBooking> {
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red[900]),
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.ShopName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.38),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.grey,
                                ),
                                Text(
                                  '${widget.shopPlace}',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text('$_rating'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15, top: 20),
              child: Row(children: [
                Text(
                  "Order Details",
                  style: TextStyle(fontSize: 16),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage(
                            "assets/images/profilelogo.png",
                          ),
                          width: 50,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.OwnerName}',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.OwnerEmail}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/membership.png"),
                                    width: 20,
                                  ),
                                  Text(
                                    "prime member",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WorkerDetails()),
                                  );
                                },
                                icon: Icon(Icons.more_horiz))
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Payment Methode",
                    style: TextStyle(fontSize: 16, fontFamily: "Poppins bold"),
                  ),
                ])),
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/pay.png"),
                  width: 35,
                ),
                Icon(Icons.add)
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Rate Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.only(left: 1),
                      itemBuilder: (context, _) => SizedBox(
                        width: 50, // set the desired width
                        height: 50, // set the desired height
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                        setState(() {
                          _rating = rating; // store the new rating value
                        });
                        // _rating = rating;
                      },
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //     child: IconButton(
                    //         onPressed: () {}, icon: Icon(Icons.cancel))),
                    Container(
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingDetails()),
                              );
                            },
                            child: Text(
                              "Next ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
