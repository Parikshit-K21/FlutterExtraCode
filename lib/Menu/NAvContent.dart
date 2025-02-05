import 'dart:io';
import 'package:dynaa/Menu/searchInput.dart';
import 'package:flutter/material.dart';

import 'QuickMenu.dart';

class FadeAppBarTutorial extends StatefulWidget {
  const FadeAppBarTutorial({super.key});

  @override
  State<FadeAppBarTutorial> createState() => _FadeAppBarTutorialState();
}

class _FadeAppBarTutorialState extends State<FadeAppBarTutorial> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FadeAppBar(scrollOffset: _scrollControllerOffset),
  backgroundColor: const Color.fromARGB(255, 37, 116, 196),
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      // image: DecorationImage(
      //   image: AssetImage('assets/backg.jpeg'),
      //   fit: BoxFit.cover,
      // ),
    ),
    child: Container(
      
      
          child: Column(
            children: [
              // Quick Menu Section
              buildHorizontalQuickMenu()
                 
            ],
          ),
        ),
    
  ),
);

  }
}






class FadeAppBar extends StatelessWidget  implements PreferredSizeWidget{
  final double scrollOffset;
  
  const FadeAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    var a = "Admin";
    return SafeArea(
  top: false,
  child: Container(
    height: 130, // Adjust height as needed to accommodate both rows
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    color: Colors.blue.shade200.withOpacity((scrollOffset / 400).clamp(0, 1).toDouble()),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
      children: [
        // First Row with Company Logo and Profile Icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items in a row
          children: [
            // Company Logo
            Container(
              child: Image.asset(
                'assets/BWlogo.jpeg', 
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 20), 

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between children
                children: [
                  // Text on the left
                  Text(
                    "Welcome Back, $a", 
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  // IconButton on the right
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white), // Profile icon
                    onPressed: () {
                      // Handle profile button press
                      print("Profile icon pressed");
                    },
                  ),
                ],
              )

          ],
        ),
        const SizedBox(height: 10), // Space between the rows
        // Search Input Widget
        Flexible(child: SearchInput()), // Search input below the icons
      ],
    ),
  ),
);

  }
  @override
  Size get preferredSize => const Size.fromHeight(130); // Set preferred height for app bar
}














class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: Center(
        child: Text('Results for "$query"', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}


final List<Map<String, dynamic>> quickMenuItems = [
  {'icon': Icons.app_registration, 'label': 'Retailer Registration'},
  {'icon': Icons.history, 'label': 'Order History'},
  {'icon': Icons.bar_chart, 'label': 'Sales Report'},
  {'icon': Icons.inventory, 'label': 'Inventory'},
  {'icon': Icons.settings, 'label': 'Settings'},
  {'icon': Icons.help, 'label': 'Help Center'},
  {'icon': Icons.support_agent, 'label': 'Customer Support'},
  {'icon': Icons.analytics, 'label': 'Analytics'},
  {'icon': Icons.campaign, 'label': 'Promotions'},
  {'icon': Icons.account_circle, 'label': 'Account Management'},
  {'icon': Icons.local_shipping, 'label': 'Delivery Status'},
  {'icon': Icons.feedback, 'label': 'Feedback'},
];

void handleQuickMenuItemTap(BuildContext context, String label) {
    if (label == 'Retailer Registration') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => const RetailerRegistrationApp()),
    //   );
    // } else if (label == 'Order History') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const ManageOrderPage()),
    //   );
    // } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$label clicked')),
      );
    }
  }


   