import 'dart:io';
import 'package:dynaa/Menu/searchInput.dart';
import 'package:dynaa/ordershow/ordershowpage.dart';
import 'package:dynaa/product/pending.dart';
import 'package:dynaa/product/popularItems.dart';
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
 body: SingleChildScrollView(
  child: Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: MediaQuery.of(context).size.width > 0 
      ? Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Quick Menu Section
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: _buildHorizontalQuickMenu2(),
              ),
              
              const SizedBox(height: 1),
              
              // Popular Products Section
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: PopularProducts(),
              ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.35,
              //   child: PendingTasksList(),
              // ),
              ElevatedButton(onPressed:
              (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ordershowpage()),
                );
              } , child: const Text('Order Task')),
            ],
          ),
        )
      : const CircularProgressIndicator(), // Show loading while size is calculated
  ),
)
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
        const Flexible(child: SearchInput()), // Search input below the icons
      ],
    ),
  ),
);

  }
  @override
  Size get preferredSize => const Size.fromHeight(130); // Set preferred height for app bar
}








 Widget _buildHorizontalQuickMenu2() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Menu',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 2),
          SizedBox(
  height: 100, // Adjust height as needed
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: quickMenuItems.length,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemBuilder: (context, index) {
      final item = quickMenuItems[index];
      return Container(
        width: 100, // Adjust width as needed
        margin: const EdgeInsets.only(right: 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Navigation logic
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item['page']),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  item['icon'] as IconData,
                  size: 32,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['label'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    },
  ),
)

        ],
      ),
    );
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
  {'icon': Icons.support_agent_rounded, 'label': 'Customer Support'},
  {'icon': Icons.analytics, 'label': 'Analytics'},
  {'icon': Icons.campaign_rounded, 'label': 'Promotions'},
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
    } else if (label == 'Order History') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ordershowpage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$label clicked')),
      );
    }
  }


   