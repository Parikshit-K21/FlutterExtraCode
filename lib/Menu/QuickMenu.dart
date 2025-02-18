 
 import 'package:flutter/material.dart';

import 'NAvContent.dart';

 Widget buildHorizontalQuickMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Menu',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 270,
            child: GridView.builder(
               
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Set to 4 items per row
              childAspectRatio: 1, // Make items square
            ),
              itemCount:quickMenuItems.length , 
              itemBuilder: (context, index) {
                final item = quickMenuItems[index];
                return GestureDetector(
                  onTap: () => handleQuickMenuItemTap(context, item['label']),
                  
                    child:  Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          
                        ),
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the icon in the circle
                children: [
                  Icon(
                    item['icon'] as IconData, // Assuming 'icon' is part of the item map
                    size: 36,
                    color: Colors.black,
                                    ),
                  const SizedBox(height: 4), // Space between icon and label
                  Text(
                    item['label'].replaceAll(' ', '\n'), // Replace spaces with newlines for better formatting
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                      ),
                      
                    ],
                      ),
                      )
                    );
             }),
          )
        ],
      ),
    );
    
  }