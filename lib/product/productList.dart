import 'package:flutter/material.dart';
import 'productDisplay.dart';

class ProductGridView extends StatelessWidget {
  // Define theme colors
   Color primaryBlue = Color(0xFF1E88E5);
   Color lightBlue = Color(0xFFBBDEFB);
   Color darkBlue = Color(0xFF1565C0);
   Color surfaceColor = Color(0xFFF5F9FF);

  final List<Map<String, dynamic>> products = [
    {
      'id': '100',
      'qty': '1',
      'name': 'Putty',
      'price': '99.99',
      'imageUrl': 'assets/proditem.jpeg',
    },
    
    {
      'id': '101',
      'qty': '1',
      'name': 'WHite Putty', 
      'price': '149.99',
      'imageUrl': 'assets/proditem.jpeg',
    },{
      'id': '102',
      'qty': '1',
      'name': 'WallCare Putty', 
      'price': '149.99',
      'imageUrl': 'assets/proditem.jpeg',
    },{
      'id': '103',
      'qty': '1',
      'name': 'WaterProof Putty', 
      'price': '149.99',
      'imageUrl': 'assets/proditem.jpeg',
    },{
      'id': '104',
      'qty': '1',
      'name': 'Cement Putty', 
      'price': '149.99',
      'imageUrl': 'assets/proditem.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final crossAxisCount = screenSize.width < 600 ? 2 : 
                          screenSize.width < 900 ? 3 : 4;
    final childAspectRatio = screenSize.width < 600 ? 0.75 : 0.8;

    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: primaryBlue,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [surfaceColor, Colors.white],
              ),
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(constraints.maxWidth * 0.03),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: constraints.maxWidth * 0.03,
                mainAxisSpacing: constraints.maxWidth * 0.03,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  primaryBlue: primaryBlue,
                  darkBlue: darkBlue,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final Color primaryBlue;
  final Color darkBlue;

  const ProductCard({
    Key? key,
    required this.product,
    required this.primaryBlue,
    required this.darkBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double titleSize = constraints.maxWidth * 0.085;
        final double priceSize = constraints.maxWidth * 0.075;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  id: product['id'] ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(product['imageUrl']),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                            letterSpacing: 0.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product['price']}',
                              style: TextStyle(
                                fontSize: priceSize,
                                color: primaryBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.add_shopping_cart_rounded,
                                color: primaryBlue,
                                size: priceSize * 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
