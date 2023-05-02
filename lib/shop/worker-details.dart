import 'package:flutter/material.dart';

class WorkerDetails extends StatelessWidget {
  const WorkerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
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
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    Text(
                      "Dilshad",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17, height: 3),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    Text(
                      "hmydilshadkt@gmail.com",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17, height: 3),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    Text(
                      "9526558430",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17, height: 3),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.red,
                    ),
                    Text(
                      "Malappuram",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17, height: 3),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.card_membership,
                      color: Colors.blue,
                    ),
                    Text(
                      "Prime member",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17, height: 3),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
