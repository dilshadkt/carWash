import 'package:flutter/material.dart';
class BookingRequest extends StatefulWidget {
  const BookingRequest({Key? key}) : super(key: key);

  @override
  State<BookingRequest> createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {




  // //document id
  // List <String> docIDs=[];
  // //get docIds
  //
  // Future getdocId() async{
  //
  //   await FirebaseFirestore.instance.collection("users").get().then((document
  //       ) => document.docs.forEach((element) {
  //         print(element.reference);
  //         docIDs.add(element.reference.id);
  //   }));
  // }


  List names =["Dilshad","Juman","Shifin","Sahad","Ali","Shibil","Dilshad","Juman","Shifin","Sahad","Ali","Shibil"];
  List vehicle =["Bike","Car","Car","Bike","Car","Car","Bike","Car","Car","Bike","Car","Car"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Container(
                          width: 55.0,
                          height: 55.0,
                          color: Colors.blue,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.blue,
                            backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/590/236/png-transparent-computer-icons-man-icon-recruiter-business-desktop-wallpaper-thumbnail.png"),
                          )
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget> [
                          Text(names[index],style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                          Text(vehicle[index],style: TextStyle(color: Colors.grey,fontSize: 14.0,fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Text("Add",style: TextStyle(color: Colors.white),),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
