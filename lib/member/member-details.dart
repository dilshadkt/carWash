import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymobile_car_wash/member/member_home.dart';



class MemberdDetails extends StatefulWidget {
  const MemberdDetails({Key? key}) : super(key: key);

  @override
  State<MemberdDetails> createState() => _MemberdDetailsState();
}

class _MemberdDetailsState extends State<MemberdDetails> {
  final _memberNameController = TextEditingController();
  final _memberEmailController = TextEditingController();
  final _memberShopController = TextEditingController();
  final _memberPlaceController = TextEditingController();
  final _memberDescriptionController = TextEditingController();
  final _memberMobileNumberController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {

    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

  String openTime='';
  String closeTime='';

  // CollectionReference users = FirebaseFirestore.instance.collection('member');
  CollectionReference users = FirebaseFirestore.instance.collection('admine');




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
        padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Enter Your Details",
                style: TextStyle(fontFamily: "Poppins bold", fontSize: 25),
              ),
            ),
            Text(
              "Please Select Your Preferred\nService Location",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text("Name",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _memberNameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Enter Your Name",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
            ),
            Text("Email",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _memberEmailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please Enter Your Email",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
            ),
            Text("Shop Name",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _memberShopController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Shop Name",
                      prefixIcon: Icon(Icons.car_crash)),
                ),
              ),
            ),
            Text("Place",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _memberPlaceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Place",
                      prefixIcon: Icon(Icons.location_on_sharp)),
                ),
              ),
            ),
            Text("Description",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Container(

              child: TextField(
                maxLines: null
                ,
                controller: _memberDescriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "About Your Service More Than 50  words",
                ),
              ),
            ),
            Text("Mobile",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _memberMobileNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "MObile Number",
                      prefixIcon: Icon(Icons.call)),
                ),
              ),
            ),
            Text("Open Time",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _selectTime(context);
                          setState(() {
                            openTime = '${selectedTime.format(context)}';
                          });
                        },
                        icon: Icon(Icons.timelapse)),
                    Text('${selectedTime.format(context)}'),
                  ],
                ),
              ),
            ),
            Text("Close Time",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _selectTime(context);
                          setState(() {
                            closeTime = '${selectedTime.format(context)}';
                          });
                        },
                        icon: Icon(Icons.timelapse)),
                    Text('${selectedTime.format(context)}'),
                  ],
                ),
              ),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: TextButton(
                          onPressed:

                              () async {
                            await users.doc("${_memberEmailController.text.trim()}")
                                .set({
                              'name': _memberNameController.text.trim(),
                              'email':_memberEmailController.text.trim(),
                              'shopname': _memberShopController.text.trim(),
                              'place': _memberPlaceController.text.trim(),
                              'description': _memberDescriptionController.text.trim(),
                              'mobile': _memberMobileNumberController.text.trim(),
                              'opentime': openTime,
                              'closetime': closeTime,
                            }).then((value) => print('user added'));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MemberHome()),
                            );
                          },

                          child: Text(
                            "Proceed",
                            style:
                            TextStyle(color: Colors.white, fontSize: 20),
                          ))),
                ),
              ],
            )
          ],
        ),
      ),
    )),
    );
  }
}
