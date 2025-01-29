import 'package:flutter/material.dart';

import 'package:dynaa/ordershow/globitems.dart' as global_state;



Widget buildShipmentCard(BuildContext context, int index, List<Map<String, dynamic>> orderItems) {
  final orderItem = orderItems[index];
  final statusText = orderItem['status'] == '1' ? 'Pending' : 'Completed';

  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tracking Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: orderItem['status'] == '1' ? Colors.orange : Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('#${orderItem['orderNumber']}'),
          const SizedBox(height: 8),
          Text(
            orderItem['productName'] as String,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Schedule Date:'),
              Text('${orderItem['scheduled date']}'),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Qty: ${orderItem['Qty']}'),
              Text('Price: ${orderItem['Price']}'),
            ],
          ),
          
        ],
      ),
    ),
  );
}