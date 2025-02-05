import 'package:dynaa/orderDet/orderTrack.dart';
import 'package:flutter/material.dart';


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
          
          EachOrderdetail(index: index),
          Flexible(child:const OrderTimelineScreen(n: 1),)
          
        ],
      ),
    ),
  );
}


}
