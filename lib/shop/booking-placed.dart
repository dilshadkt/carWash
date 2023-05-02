import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/user/home.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserHome( useremail: "")),
              );
            },
            child: Image(
              image: AssetImage(


                "assets/images/order-placed.png",
              ),
              width: 200,
            ),
          ),

          Text("Order placed",style: TextStyle(color: Colors.green,fontSize: 17),)
        ]),
      )),
    );
  }
}
