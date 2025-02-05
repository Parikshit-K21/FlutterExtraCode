import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = '';
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        height: screenHeight - appBarHeight - statusBarHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Product Image
              Container(
                height: screenHeight * 0.35, // 35% of screen height
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'proditem.jpeg',
                  fit: BoxFit.fill,
                ),
              ),

              // Size Selection
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: sizes.map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: selectedSize == size 
                              ? Colors.blue
                              : Colors.transparent,
                          border: Border.all(
                            color: selectedSize == size 
                                ? Colors.blue 
                                : Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedSize == size 
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: selectedSize == size
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Combined Container for Product Details and Purchase Options
              Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 155, 190, 240),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Product Name
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      child: const Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Product Description
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'This is a detailed description of the product. You can add multiple lines of text here to describe your product features and benefits.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Price and Add to Cart Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 190, 240),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 10, 10, 130),
                                  ),
                                ),
                                Text(
                                  '\$99.99',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add to cart logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
