import 'package:flutter/material.dart';
import 'dart:convert';

import 'productMod.dart';



class CartDetail extends StatelessWidget {
  const CartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cart UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Dark background
        cardColor: Colors.blue[400], // Card background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Appbar background
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Default text color
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.blue), // Icon color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Proceed button color
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Cart UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> cartItems = [];
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _loadCartData();
  }

  // Simulate loading cart data from JSON
  Future<void> _loadCartData() async {
    // Sample JSON data (replace with your actual JSON loading logic)
    var jsonString = cartItems;

    List<dynamic> jsonData = jsonDecode(jsonString as String);
    setState(() {
      cartItems = jsonData.map((item) => Product.fromJson(item)).toList();
      _calculateTotalPrice();
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
      _calculateTotalPrice();
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
      _calculateTotalPrice();
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      _calculateTotalPrice();
    });
  }


  void _calculateTotalPrice() {
    totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: const Text('My Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.only(right: 12.0),
                                child:  Image(image:AssetImage("proditem.jpeg"),
                                fit: BoxFit.cover,),
                                // You can replace color with Image.network or Image.asset
                              ),
                              Expanded(
                                child: 
                                Container ( child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () => _removeItem(index),
                                            ),
                                          ],
                                        ),
                                        Text('Rs. ${product.price.toStringAsFixed(0)}'),
                                      ],
                                    ),]))),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove_circle_outline),
                                            onPressed: () => _decreaseQuantity(index),
                                          ),
                                          Text('${product.quantity}', style: const TextStyle(fontSize: 18)),
                                          IconButton(
                                            icon: const Icon(Icons.add_circle_outline),
                                            onPressed: () => _increaseQuantity(index),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }
                          )
                      ),
              
                Center( child: 
                Container(

                  height: 80,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${cartItems.length} items', style: const TextStyle(fontSize: 16)),
                          Text('Rs. ${totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Proceed to Pay action
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text('Checkout', style: TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
                )
              ],

            ),
    );
  }
}


