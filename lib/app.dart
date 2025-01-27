
import "package:dynaa/oderdetail.dart";
import "package:dynaa/orderTrack.dart";
import "package:dynaa/NAv.dart";
import "package:dynaa/ordershowpage.dart";
import "package:dynaa/qr.dart";
import "package:flutter/material.dart";
import 'package:dynaa/data.dart'; // Ensure this import is present


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  @override
  Widget build(BuildContext context) {

    
    return const MaterialApp(
      title: "RBAC Demo",
      home: FadeAppBarTutorial()
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
