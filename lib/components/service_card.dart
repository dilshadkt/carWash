import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard({super.key});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final List _selectedIndexs = [];
  Color borderColor = Colors.black;
  bool selected = false;
  List<Map<String, dynamic>> washcard = [
    {"icon": Icons.car_rental, "text": "Classic\nWashing"},
    {"icon": Icons.card_giftcard, "text": "form\nWashing"},
    {"icon": Icons.card_membership, "text": "Engine\nWashing"},
    {"icon": Icons.card_travel, "text": "Body\nWaxing"},
  ];
  List<String> path = [
    "assets/images/service.png",
    "assets/images/Exterior.png",
    "assets/images/mech.png",
    "assets/images/polish.png"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: path.length,
          itemBuilder: ((context, index) {
            final _isSelected = _selectedIndexs.contains(index);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (_isSelected) {
                    _selectedIndexs.remove(index);
                  } else {
                    _selectedIndexs.add(index);
                  }
                });
              },
              child: Card(
                shape: _isSelected
                    ? RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(15))
                    : RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.white,
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(
                        path[index],
                        // width: 60,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        washcard[index]["text"],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
