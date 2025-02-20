
import 'package:dynaa/jsonfolder/globitems.dart';
import 'package:flutter/material.dart';

import 'qtyChange.dart';

import 'package:flutter/material.dart';



class ProductDetailPage extends StatefulWidget {
  final String id;
var products=sampleProduct;

  ProductDetailPage({super.key,
    required this.id,
  // Updated to receive products
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = '';
  double selectedPrice = 0.0; // To store selected price
  Map<String, Object>? productData; // Store fetched product data

 
  List<String> sizes = []; // Dynamically populated sizes
  String productName = 'Product Name'; // Default name
  String productDescription = 'Product Description'; // Default description
  String productImage = 'assets/default.png'; // Default image

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  void _loadProductDetails() {
    productData = widget.products.firstWhere(
      (p) => p['id'] == widget.id,
      orElse: () => {'id': 'not_found', 'imageUrl': 'assets/default.png'},
    ) as Map<String, Object>?;

    if (productData != null && productData!['id'] != 'not_found') {
      setState(() {
        productName = productData!['name'] as String? ?? 'Product Name';
        productDescription = productData!['description'] as String? ?? 'Product Description';
        productImage = (productData!['imageUrl'] as String?) ?? 'assets/default.png';

        // Extract sizes from variants and set default selected size and price
        List<Map<String, Object>> variants = (productData!['variants'] as List<Map<String, Object>>?) ?? [];
        sizes = variants.map((v) => v['size'].toString()).toList();
        if (sizes.isNotEmpty) {
          selectedSize = sizes.first; // Select the first size by default
          _updatePriceForSize(selectedSize); // Update price based on first size
        }
      });
    }
  }


  void _updatePriceForSize(String size) {
    if (productData != null) {
      List<Map<String, Object>> variants = (productData!['variants'] as List<Map<String, Object>>?) ?? [];
      var selectedVariant = variants.firstWhere(
            (variant) => variant['size'] == size,
        orElse: () => {}, // Return empty map if size not found
      );
      setState(() {
        selectedPrice = (selectedVariant['price'] as num?)?.toDouble() ?? 0.0; // Default to 0 if price is not found
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (productData == null || productData!['id'] == 'not_found') {
      return Scaffold(
        appBar: AppBar(title: const Text('Product Detail')),
        body: const Center(child: Text('Product not found')),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Product Image Section - 40% of screen height
          Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Image.asset(
                productImage, // Use productImage variable
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Size Selection Section - 20% of screen height
          Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: sizes.map((size) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                        _updatePriceForSize(size); // Update price when size changes
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        color: selectedSize == size ? Colors.blue : Colors.transparent,
                        border: Border.all(
                          color: selectedSize == size ? Colors.blue : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.075),
                      ),
                      child: Center(
                        child: Text(
                          size,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: selectedSize == size ? FontWeight.bold : FontWeight.normal,
                            color: selectedSize == size ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Product Details Section - 40% of screen height
          Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 155, 190, 240),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Text(
                      productName, // Use productName variable
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Text(
                        productDescription, // Use productDescription variable
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 10, 10, 130),
                                ),
                              ),
                              Text(
                                '\$${selectedPrice.toStringAsFixed(2)}', // Use selectedPrice variable
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add to cart logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
          ),
        ],
      ),
    );
  }
}

