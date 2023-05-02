import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../shop/shop_home.dart';

class UserInformation extends StatelessWidget {
  CollectionReference member=FirebaseFirestore.instance.collection('member');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: member.snapshots(),
      builder: ( context,snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopHome(
                            shopOwner:  snapshot.data?.docs[index]['name'],
                            shopName:  snapshot.data?.docs[index]['shopname'],
                            shopAdd:  snapshot.data?.docs[index]['place'],
                            shopDesc:   snapshot.data?.docs[index]['description'],
                            shopImg:  "assets/images/vw-1409153__340.jpg", shopEmail: snapshot.data?.docs[index]['email'],

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
                          image: AssetImage("assets/images/vw-1409153__340.jpg"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data?.docs[index]['shopname'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_sharp),
                                  Text(
                                    snapshot.data?.docs[index]['place'],
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
                                Text("2"),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data?.docs[index]['opentime'],
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
                ),
              );
            },);

        // return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['shopname']),
        //       subtitle: Text(data['place']),
        //     );
        //   }).toList(),
        // );
      },
    );
  }
}
