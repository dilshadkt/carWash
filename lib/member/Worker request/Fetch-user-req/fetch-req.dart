import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shop/shop_home.dart';

class FetchReq extends StatelessWidget {
  CollectionReference member = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: member.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Padding(
          padding: EdgeInsets.all(10),
          child: ListView.separated(
            itemCount: snapshot.data?.docs?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[200],
                  ),
                  child: ListTile(
                    title: Text(
                      snapshot.data?.docs[index]['name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    subtitle: Text(snapshot.data?.docs[index]['type']),
                    leading: Icon(Icons.add),
                    textColor: Colors.white,
                    trailing: Column(
                      children: [
                        Text(snapshot.data?.docs[index]['time']),
                        Text(snapshot.data?.docs[index]['date'])
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              ),
        );
      },
    );
  }
}
