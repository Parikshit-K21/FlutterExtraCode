import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts({Key? key}) : super(key: key);

  final colr=Colors.blue[800];

  @override
  Widget build(BuildContext context) {
    return Container (
      width: double.infinity,
      
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Text(
                'Most Popular',
                style: TextStyle(
                  color: colr,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {}, // Implement "See More" functionality
                child: const Text(
                  'See More',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Flexible(child:
        SizedBox(
          height: 320, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Replace with actual product count
            itemBuilder: (context, index) {
              return _buildProductCard(index);
            },
          ),
        ),
        ),
      ],
      )
    );
  }

  Widget _buildProductCard(int index) {
    final products = [
      {
        'name': 'Schweppes',
        'price': '\$9.00',
        'image': 'proditem.jpeg', // Replace with actual image paths
      },
      {
        'name': 'Fanta',
        'price': '\$8.50',
        'image': 'proditem.jpeg',
      },
      {
        'name': 'Sprite',
        'price': '\$7.00',
        'image': 'proditem.jpeg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: Column(
        children: [
          Container(
            width: 110, // Adjust width as needed
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              
              borderRadius: BorderRadius.circular(250),

              color: Colors.blue[50],
            ),
            child:  Center(

              
              child: ClipRRect(
              borderRadius: BorderRadius.zero,

                child: Column(
                  children: [
                    Positioned(
                      top: -20,
                      child: 
                  Image.asset(
                  products[index]['image'] as String,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),),
                const SizedBox(height: 10,),
          Text(
            products[index]['name'] as String,
            style:  TextStyle(color: colr,fontSize: 12.0),
          ),
          const SizedBox(height: 10,),
          Text(
            products[index]['price'] as String,
            style:  TextStyle(
              color: colr,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
                  ]),
              ),
            ),
          ),
        ]
      ),
    
    );
  }
}