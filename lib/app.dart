
import "package:dynaa/Menu/NAvContent.dart";
import "package:dynaa/orderDet/OrderDetails.dart";
import "package:dynaa/orderDet/eachOrder.dart";
import "package:dynaa/ordershow/ordershowpage.dart";
import "package:dynaa/productcart/productDisplay.dart";

import "package:flutter/material.dart";
import 'package:dynaa/data.dart';

import "productcart/productList.dart"; // Ensure this import is present


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      title: "RBAC Demo",
      home: Ordershowpage() 
          // OrderDetails(index: 1) 
      );
      }


// Use admin menu
final adminMenu = menuData;

// Use user menu  
final userMenu = menuData2;
      
}

  class MenuItem {
  final String title;
  final List<String> subLinks;

  MenuItem({required this.title, required this.subLinks});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json["title"],
      subLinks: List<String>.from(json["subLinks"]),
    );
  }
} 
