import 'package:dynaa/ordershow/shipMentCard.dart';
import 'package:dynaa/ordershow/tabbarselct.dart';
import 'package:flutter/material.dart';

class Ordershowpage extends StatelessWidget {
  const Ordershowpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders History'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CircleAvatar(
            //       backgroundImage: AssetImage('BWlogo.jpeg'), // Replace with actual image path
            //       radius: 25,
            //     ),

            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Jessica',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
                    
                  
            //       ],
            //     ),
            //   ],
            // ),
            
            SizedBox(height: 20),
            Text(
              'Orders History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Flexible(child: TabBarAndTabViews(),),
            SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}