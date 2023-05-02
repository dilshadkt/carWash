import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data().toString() as Map<String, dynamic>;
          String name=data['username'];
          return ListTile(title: Text('${data['name']}'),
            subtitle: Text('${data['type']}'),
            leading: Icon(Icons.add),

            textColor: Colors.white,
            trailing: Column(children: [
              Text("${data['time']}"),
              Text("${data['date']}")

            ],),
          );

        }

        return Text("loading", );
      },
    );
  }
}