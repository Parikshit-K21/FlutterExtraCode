import 'package:dynaa/ordershow/globitems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EachOrderdetail extends StatelessWidget {
  final int index;
   
 EachOrderdetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final Item = orderItems[index]; // Access the item from the global list

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 2),
        color:  const Color.fromARGB(255, 150, 190, 240), // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 5, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row( children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
              children: [
                 Text(
                  'Consumer Number',
                  style: fontText(12),
                ),
                const SizedBox(height: 6),
                Text(
                  '${Item['orderNumber']}',
                  style: fontText(18),
                ),
              ],
            ),
            const Spacer(), // Add a spacer to align the image to the right
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                  child: Image.asset(
                    fit: BoxFit.fill,
                    'barrcode.jpeg', // Replace with actual logo path
                    width: 150,
                    height: 45,
                  ),
                ),
            ]
            ),
          
          
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
              children: [
                Text(
                  'Bill Date',
                  style: fontText(12),
                ),
                const SizedBox(height: 6),
                Text(
                  '${Item['scheduled date']}', // Use the actual 'date' from the item
                  style: fontText(18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
                  children: [
                     Text(
                      'Due Amount',
                      style: fontText(12),
                    ),
                    const SizedBox(height: 6),
                    Text(                  
                      '₹${Item['Price']}', // Use the actual 'Price' from the item
                      style: fontText(18),),
                  ],
                ),
                const Spacer(), // Add a spacer to align the imag20e to the right
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: Image.asset(
                    fit: BoxFit.fill,
                    'BWlogo.jpeg', // Replace with actual logo path
                    width: 150,
                    height: 75,
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
TextStyle fontText(double a) {
    return GoogleFonts.robotoFlex(
      textStyle: TextStyle(
        color: Colors.black,
        letterSpacing: 0.5,
        fontSize: a,
        fontWeight: FontWeight.bold,
        
      ),
    );
  }