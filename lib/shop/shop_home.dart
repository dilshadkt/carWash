
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mymobile_car_wash/shop/shop_booking.dart';


_callNumber() async {
  const number = '08592119XXXX'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}


class ShopHome extends StatelessWidget {
  final String shopName;
  final String shopAdd;
  final String shopDesc;
  final String shopImg;
  final String shopOwner;
  final String shopEmail;
  ShopHome(
      {Key? key,
        required this.shopName,
        required this.shopAdd,
        required this.shopDesc,
        required this.shopOwner,
        required this.shopEmail,
        required this.shopImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(shopImg),
                ),
                Text(
                  shopName,
                  style: TextStyle(fontSize: 22.37, fontFamily: 'Poppins bold'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7, bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.grey,
                      ),
                      Text(
                        shopAdd,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 20, fontFamily: 'Poppins bold'),
                      ),
                    )),
                SizedBox(
                  height: 200,
                  child: Text(
                    shopDesc+shopDesc,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        wordSpacing: -1,
                        height: 1.7),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Services",
                      style: TextStyle(fontSize: 19, fontFamily: 'Poppins bold'),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[400]),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage("assets/images/bodyser.png"),
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                child: Center(
                                  child: Text("Car Cleaning\n&spa"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[400]),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage("assets/images/full_ser.png"),
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                child: Center(
                                  child: Text("Car Cleaning\n&spa"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[400]),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage("assets/images/wet.png"),
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                child: Center(
                                  child: Text("Car Cleaning\n&spa"),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: EdgeInsets.all(12), child: Icon(Icons.mail)),
                      ),
                      Container(
                        height: 60,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: IconButton(
                                onPressed: _callNumber, icon: Icon(Icons.call))),
                      ),
                      Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  print(shopOwner);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopBooking(OwnerName: shopOwner, shopPlace: shopAdd, ShopName: shopName, OwnerEmail: shopEmail,)),
                                  );
                                },
                                child: Text(
                                  "book now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
