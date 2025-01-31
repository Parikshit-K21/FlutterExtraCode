import 'package:dynaa/ordershow/globitems.dart';
import 'package:flutter/material.dart';

class EachOrderdetail extends StatelessWidget {
  final int index;

  const EachOrderdetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item = orderItems[index]; // Access the item from the global list

    return  Container(
      // width: 250, // Adjust width as needed
      // height: 240, // Adjust height as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white, // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 5, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
            
              children: [
                const Text(
                   textAlign: TextAlign.right,
                  'Consumer Number',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                   textAlign: TextAlign.center,
                  '${Item['orderNumber']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Text(
                   textAlign: TextAlign.left,
                  'Bill Date',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
         SizedBox(height: 6,),

                Text(
                  '${Item['scheduled date']}', // Use the actual 'date' from the item
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    const Text(

                      'Due Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                                    SizedBox(height: 6,),

                    Text(                  
                         textAlign: TextAlign.center,
                      '₹${Item['Price']}', // Use the actual 'Price' from the item
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Add a spacer to align the image to the right
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'BWlogo.jpeg', // Replace with actual logo path
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    
    );
    
  }
}