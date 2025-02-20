import 'package:dynaa/jsonfolder/globitems.dart';
import 'package:dynaa/orderDet/OrderDetails.dart';
import 'package:dynaa/product/productDisplay.dart';
import 'package:dynaa/product/productList.dart';
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
                onPressed: () 
                {
            Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductGridView()),// see more navigation
      );}, 
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
              return _buildProductCard(index, context);
            },
          ),
        ),
        ),
      ],
      )
    );
  }

  Widget _buildProductCard(int index, BuildContext context) {
    var products = cartitems;

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
                    child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(id: products[index]['prod_id']!,  )
                      ),
                      );
                    },
                    child: Image.asset(
                      products[index]['imageUrl'] as String,
                      width: 80,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    ),
                  ),
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