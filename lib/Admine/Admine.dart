import 'package:flutter/material.dart';

import 'fetch-workers-data.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  // List names =["Dilshad","Juman","Shifin","Sahad","Ali","Shibil","Dilshad","Juman","Shifin","Sahad","Ali","Shibil"];
  // List locality =["calicut","malappuram","kondotty","ramanattukara","feroke","kottakkal","pulikkal","beypore","manjeri","morayur","kottakkal","ramanattukara"];
  // List qualification =["sslc","plus two","sslc","plus one","plus two","sslc","plus one","plus two","sslc","plus one","sslc","plus one"];

  @override
  Widget build(BuildContext context) {
    return WorkerInformation();
  }
}
