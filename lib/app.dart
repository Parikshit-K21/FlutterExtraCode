
import "package:dynaa/Menu/NAvContent.dart";
import "package:dynaa/mix.dart";
import "package:dynaa/orderDet/OrderDetails.dart";
import "package:dynaa/ordershow/CusNumOrder.dart";
import "package:dynaa/ordershow/ordershowpage.dart";
import "package:dynaa/product/pending.dart";
import "package:dynaa/product/popularItems.dart";
import "package:dynaa/product/product%20cart/cart.dart";
import "package:dynaa/product/productDisplay.dart";

import "package:flutter/material.dart";
import 'package:dynaa/data.dart';

import "orderDet/orderTrack.dart";
import "product/productList.dart"; // Ensure this import is present


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  @override
  Widget build(BuildContext context) {

    
    return  MaterialApp(
      title: "RBAC Demo",
      home: //Ordershowpage() 
         //OrderDetails(index: 1) 
         //PendingTasksList(),
         //ProductGridView(),
         //OrderTrackingWidget(currentStatus: 1)
        FadeAppBarTutorial()
        //CartDetail()
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
