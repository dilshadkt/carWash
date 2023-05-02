import 'package:flutter/material.dart';
import 'package:mymobile_car_wash/shop/booking-placed.dart';
import '../components/date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
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

  DateTime selectedDate = DateTime.now();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _placeController = TextEditingController();
  final _addressController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  String bookingTime = '';
  String bookingDate = '';

  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
                  "Select our Service",
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
                    controller: _nameController,
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
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Please Enter Your email",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                ),
              ),
              Text("Vehicle Type",
                  style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _vehicleController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Car or Bike",
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
                    controller: _placeController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter you current place",
                        prefixIcon: Icon(Icons.location_on_sharp)),
                  ),
                ),
              ),
              Text("Address",
                  style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
              Container(
                child: SizedBox(
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Address",
                    ),
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
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "MObile Number",
                        prefixIcon: Icon(Icons.call)),
                  ),
                ),
              ),
              Text("Time",
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
                              bookingTime = '${selectedTime.format(context)}';
                            });
                          },
                          icon: Icon(Icons.timelapse)),
                      Text('${selectedTime.format(context)}'),
                    ],
                  ),
                ),
              ),
              Text("Date",
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
                            selectDate(context, selectedDate, (DateTime date) {
                              setState(() {
                                selectedDate = date;
                                bookingDate =
                                    "${selectedDate.toLocal()}".split(' ')[0];
                              });
                            });
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          )),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                      ),
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
                            onPressed: () async {
                              await users.doc("${_emailController.text.trim()}")
                                  .set({
                                'name': _nameController.text.trim(),
                                'type': _vehicleController.text.trim(),
                                'place': _placeController.text.trim(),
                                'address': _addressController.text.trim(),
                                'mobile': _mobileNumberController.text.trim(),
                                'time': bookingTime,
                                'date': bookingDate,
                              }).then((value) => print('user added'));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderPlaced()),
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
