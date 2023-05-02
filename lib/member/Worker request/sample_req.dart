import 'package:flutter/material.dart';

import 'Fetch-user-req/fetch-req.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return FetchReq();
  }
}
