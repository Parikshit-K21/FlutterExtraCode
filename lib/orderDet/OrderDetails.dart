import 'package:dynaa/content.dart';
import 'package:dynaa/orderDet/orderTrack.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';


import 'oderdetailAI.dart'; // Assuming this is the correct import

class OrderDetails extends StatelessWidget {
  final int index;

  const OrderDetails({super.key, required this.index});

 @override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const OrderTimelineScreen(n: 1),
          EachOrderdetail(index: index),
        ],
      ),
    ),
  );
}


}
