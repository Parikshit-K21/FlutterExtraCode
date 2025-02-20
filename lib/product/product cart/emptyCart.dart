import 'package:flutter/material.dart';


class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empty Cart UI',
      theme: ThemeData(
        primarySwatch: Colors.green, // Green theme to match button color
        scaffoldBackgroundColor: Colors.white, // White background
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87), // Default text color
          titleMedium: TextStyle(color: Colors.black87),
          titleSmall: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.black87),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // White AppBar background
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20), // Title text color
          iconTheme: IconThemeData(color: Colors.black87), // Icon color
          elevation: 0, // No shadow for AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFECF0E1), // Light Green button background
            foregroundColor: Colors.black87, // Button text color
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded corners
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF90BE6D), // Green Bottom App Bar color
          elevation: 0,
        ),
      ),
      home: const EmptyCartScreen(),
    );
  }
}

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leadingWidth: 150, // Adjust to fit "Estimated $0.00" comfortably
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Estimated \$0.00',
              style: TextStyle(color: Colors.grey[600], fontSize: 16), // Greyed out "Estimated" text
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '0 items',
                style: TextStyle(color: Colors.grey[600], fontSize: 16), // Greyed out "0 items" text
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.shopping_basket_outlined, // You can replace with a custom asset image
                size: 100,
                color: Colors.grey[400], // Light grey icon color
              ),
              const SizedBox(height: 20),
              const Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Fill up your cart with fresh groceries and\neveryday essentials. Start shopping now!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle "View trending items" action
                },
                child: const Text('View trending items'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar( // Using BottomAppBar for the "Go to checkout" button area
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Handle "Go to checkout" action (could be disabled in empty cart scenario)
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF90BE6D), // Green button background
              foregroundColor: Colors.white, // White button text color
            ),
            child: const Text('Go to checkout'),
          ),
        ),
      ),
    );
  }
}