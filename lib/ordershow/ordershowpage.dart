import 'package:dynaa/ordershow/CusNumOrder.dart';
import 'package:dynaa/ordershow/tabbarselct.dart';
import 'package:flutter/material.dart';

class Ordershowpage extends StatelessWidget {
  const Ordershowpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders History'),
        backgroundColor: const Color.fromARGB(255, 181, 198, 212),
      ),
      body: Container(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3, // Reduced flex ratio
          child: EachOrderdetail(index: 0),
        ),
        const SizedBox(height: 2), // Reduced spacing
        const Text(
          'Orders History',
          style: TextStyle(
            fontSize: 16, // Reduced font size
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2), // Reduced spacing
        const Expanded(
          flex: 5, // Reduced flex ratio
          child: TabBarAndTabViews(),
        ),
        const SizedBox(height: 2), // Reduced spacing
      ],
    ),
  ),
),    );
  }
}