import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Products',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 400, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Replace with actual product count
            itemBuilder: (context, index) {
              return _buildProductCard();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          Container(
            width: 200, // Adjust width as needed
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 100),
          Positioned(
            top: -30, // Adjust offset as needed
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('proditem.jpeg', // Replace with actual image URL
                width: 150,
                height: 250,
                fit: BoxFit.fitWidth,
              
              ),
            ),
          ),
         const  Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(fontSize: 12.0),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$19.99',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}