import 'package:dynaa/ordershow/globitems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EachOrderdetail extends StatelessWidget {
  final int index;
   
  EachOrderdetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cusinfo = userName[index];
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600; // Breakpoint for tablet

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        color: const Color.fromARGB(255, 150, 190, 240),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consumer Number',
                        style: fontText(isTablet ? 16 : 12),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        '${cusinfo['custNo']}',
                        style: fontText(isTablet ? 22 : 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.06),
                    child: Image.asset(
                      'barrcode.jpeg',
                      fit: BoxFit.fill,
                      height: screenSize.height * 0.07,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: fontText(isTablet ? 16 : 12),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  '${cusinfo['username']}',
                  style: fontText(isTablet ? 22 : 18),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Number',
                        style: fontText(isTablet ? 16 : 12),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        '${cusinfo['phone']}',
                        style: fontText(isTablet ? 22 : 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'BWlogo.jpeg',
                    fit: BoxFit.fill,
                    height: screenSize.height * 0.1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle fontText(double size) {
    return GoogleFonts.robotoFlex(
      textStyle: TextStyle(
        color: Colors.black,
        letterSpacing: 0.5,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
