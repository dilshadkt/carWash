import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/member/login-member.dart';
import 'package:mymobile_car_wash/member/member-details.dart';

class MemberIndroduction extends StatelessWidget {
  const MemberIndroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image(image: AssetImage("assets/images/spalsh.png"))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wash,",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins bold",
                      fontSize: 49),
                ),
                Text(
                  "Rinse,Shine,",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins bold",
                      fontSize: 49),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "We have made it easy for you to book your\ncar wash and detailing services through our platform.",
                    style: TextStyle(color: Colors.grey, fontSize: 17,height: 2),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MemberdDetails()),
                          );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
