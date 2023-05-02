import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkerInformation extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('member');
  CollectionReference member = FirebaseFirestore.instance.collection('admine');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: member.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if(snapshot.hasData==""){
          return Text("empty");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Scaffold(
          body: SafeArea(

            child: ListView.builder(
              itemCount: snapshot.data?.docs.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: 55.0,
                                height: 55.0,
                                color: Colors.blue,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.blue,
                                  backgroundImage: NetworkImage(
                                      "https://w7.pngwing.com/pngs/590/236/png-transparent-computer-icons-man-icon-recruiter-business-desktop-wallpaper-thumbnail.png"),
                                )),
                            SizedBox(width: 5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data?.docs[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data?.docs[index]['place'],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data?.docs[index]['email'],
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 12.0),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              await users
                                  .doc("${snapshot.data?.docs[index]['email']}")
                                  .set({
                                'name': snapshot.data?.docs[index]['name'],
                                'email': snapshot.data?.docs[index]['email'],
                                'shopname': snapshot.data?.docs[index]['shopname'],
                                'place': snapshot.data?.docs[index]['place'],
                                'description': snapshot.data?.docs[index]
                                    ['description'],
                                'mobile': snapshot.data?.docs[index]['mobile'],
                                'opentime': snapshot.data?.docs[index]['opentime'],
                                'closetime': snapshot.data?.docs[index]
                                    ['closetime'],
                              }).then((value) => print('user added'));
                        /////////////delete data from admine
                              member
                                  .doc('${snapshot.data?.docs[index]['email']}')
                                  .delete()
                                  .then((value) => print("User Deleted"))
                                  .catchError((error) => print("Failed to delete user: $error"));

                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
