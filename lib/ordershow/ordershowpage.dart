import 'package:dynaa/orderDet/eachOrder.dart';
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
      body: Container
      (
        
        child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        
        Column(
          
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
            Flexible(child:EachOrderdetail( index: 0,),),
            const SizedBox(height: 5),
            const Text(
              'Orders History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Flexible(child: TabBarAndTabViews(),),
            const SizedBox(height: 5),
            
          ],
        ),
      ),
    ),
    );
  }
}