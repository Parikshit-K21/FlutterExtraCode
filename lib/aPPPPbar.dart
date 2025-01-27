// import 'package:flutter/material.dart';
// import 'package:login/Pages/Profile.dart';
// import 'package:login/Pages/RetailerEntry.dart';
// import 'package:login/Pages/content.dart';
// import 'package:login/Pages/order_update.dart';
// import 'package:login/QR_scanner.dart';
// import 'app_links.dart';


// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class _CustomAppBarState extends State<CustomAppBar> {

// String? selectedRole;
//   final List<String> roles = ['user', 'admin', 'employee'];
  
// final Map<String, Map<String, dynamic>> roleMenuData = {
//   'admin': {
//     'transactionLinks': [
//       {
//         'title': 'Financial Accounts',
//         'subLinks': [
//           'Token Scan',
//           'Balance Confirmation',
//           'Invoice Acknowledgement',
//           'Ever White Coupon Generation',
//           '194Q Detail Entry',
//           'Token Scan Details',
//           'Token Scan Report',
//           'Token Scan New'
//         ]
//       },
//       {
//         'title': 'Depot Order',
//         'subLinks': [
//           'Secondary Sale Capture',
//           'Order Update',
//           'Order Entry'
//         ]
//       },
//       {
//         'title': 'Retailer',
//         'subLinks': [
//           'Rural Retailer Entry/Update',
//           'Retailer Registration'
//         ]
//       },
//       {
//         'title': 'Sales Force',
//         'subLinks': [
//           'Notification Sent Details',
//           'User Rating'
//         ]
//       },
//       {
//         'title': 'Mission Udaan',
//         'subLinks': [
//           'Invoice Cancellation in Bulk',
//           'Secondary Sales Invoice Entry'
//         ]
//       }
//     ],
//     'reportLinks': [
//       {
//         'title': 'SAP Reports',
//         'subLinks': [
//           'Day Summary',
//           'Day wise Details',
//           'Day Summary Qty/Value Wise',
//           'Sales-Purchase-wise Packaging-wise',
//           'Year on Year Comparison'
//         ]
//       },
//       {
//         'title': 'General Reports',
//         'subLinks': [
//           'Pending freight report',
//           'Account statement',
//           'Contact us',
//           'Information document'
//         ]
//       },
//       {
//         'title': 'MIS Reports',
//         'subLinks': ['Purchaser aging report (SAP)']
//       },
//       {
//         'title': 'Sales Reports',
//         'subLinks': [
//           'Product catg-wise sales',
//           'Sales growth overview YTD/MTD'
//         ]
//       },
//       {
//         'title': 'Secondary Sale',
//         'subLinks': [
//           'Stock & RollOut data (Tally)',
//           'Secondary Sale (Tally)',
//           'Stock Data (Tally)',
//           'Retailers Sales Report',
//           'Retailer Target Vs Actual',
//           'My Network',
//           'Tally Data Customer Wise'
//         ]
//       }
//     ],
//     'masterLinks': [
//       {
//         'title': 'Customer',
//         'subLinks': [
//           'Purchaser Profile',
//           'TAN No Update',
//           'SAP Invoice Printing'
//         ]
//       },
//       {
//         'title': 'Misc Master',
//         'subLinks': ['Pin Code Master', 'Profile Photo']
//       },
//       {
//         'title': 'Credit Note',
//         'subLinks': ['Guarantor Orc Entry', 'Guarantor Orc View']
//       }
//     ],
//     'miscLinks': ['Change Password', 'Software Download', 'Photo Gallery', 'SMS Query Code Help']
//   },
//   'user': {
//     'transactionLinks': [
//       {
//         'title': 'Depot Order',
//         'subLinks': [
//           'Secondary Sale Capture',
//           'Order Update',
//           'Order Entry'
//         ]
//       },
//       {
//         'title': 'Retailer',
//         'subLinks': [
//           'Rural Retailer Entry/Update',
//           'Retailer Registration'
//         ]
//       }
//     ],
//     'reportLinks': [
//       {
//         'title': 'SAP Reports',
//         'subLinks': [
//           'Day Summary',
//           'Day wise Details',
//           'Day Summary Qty/Value Wise'
//         ]
//       },
//       {
//         'title': 'General Reports',
//         'subLinks': [
//           'Pending freight report',
//           'Account statement'
//         ]
//       }
//     ],
//     'masterLinks': [],
//     'miscLinks': ['Change Password', 'Software Download']
//   }
// };

//   Map<String, dynamic> get currentMenuData => 
//     roleMenuData[selectedRole ?? 'user'] ?? roleMenuData['user']!;





//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return AppBar(
//       backgroundColor: Colors.blueAccent,
//       flexibleSpace: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const ContentPage()),
//           );
//         },
        
//       ),
//       leading: Padding(
//         padding: const EdgeInsets.all(8.0),
//     child: Expanded(
//         child: DropdownButton<String>(
//           dropdownColor: Colors.blue,
//           value: selectedRole ?? 'user',
//           hint: const Text(
//             'Select Role',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           icon: const Icon(Icons.person, color: Colors.white),
//           underline: Container(),
//           items: roles.map<DropdownMenuItem<String>>((String role) {
//             return DropdownMenuItem<String>(
//               value: role,
//               child: Text(
//                 role,
//                 style: TextStyle(
//                   color: selectedRole == role ? Colors.blue : Colors.white,
//                 ),
//               ),
//             );
//           }).toList(),
//           onChanged: (String? newValue) {
//             setState(() {
//               selectedRole = newValue;
//             });
//           },
//         ),
//       ),
//       ),
//       title: screenWidth > 800
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                     _buildMenu(context, 'Transactions', currentMenuData['transactionLinks'] ?? []),
//                     _buildMenu(context, 'Reports', currentMenuData['reportLinks'] ?? []),
//                     _buildMenu(context, 'Master', currentMenuData['masterLinks'] ?? []),
//                     _buildMenu(context, 'Misc', currentMenuData['miscLinks'] ?? []),
//                   ],
//             )
//           : null,
          
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.search, color: Colors.white),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: const Icon(Icons.list, color: Colors.white),
//           onPressed: () {
//             Scaffold.of(context).openEndDrawer(); // Open right sidebar
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.notifications, color: Colors.white),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: const CircleAvatar(
//             backgroundColor: Colors.white,
//             child: Icon(Icons.person, color: Colors.blue),
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const ProfilePage()),
//             );
//           },
//         ),
//       ],
//     );
//   }
  

//   // void _openSidebar(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     builder: (context) => const CustomSidebar(),
//   //   );
//   // }

//   Widget _buildMenu(BuildContext context, String title, List items) {
//   return PopupMenuButton<String>(
//     tooltip: title,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           const Icon(Icons.arrow_drop_down, color: Colors.white),
//         ],
//       ),
//     ),
//     itemBuilder: (context) => items.map<PopupMenuEntry<String>>((item) {
//       if (item is Map<String, dynamic>) {
//         return PopupMenuItem<String>(
//           child: PopupMenuButton<String>(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(item['title']),
//                 const Icon(Icons.arrow_right, size: 16),
//               ],
//             ),
//             itemBuilder: (context) => 
//               (item['subLinks'] as List).map<PopupMenuItem<String>>((subLink) =>
//                 PopupMenuItem<String>(
//                   value: subLink,
//                   child: Text(subLink),
//                   onTap: () {
//                     Future.delayed(
//                       const Duration(seconds: 0),
//                       () {
//                         if (subLink == 'Rural Retailer Entry/Update') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RetailerRegistrationApp2(),
//                             ),
//                           );
//                         } else if (subLink == 'Token Scan') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const QrCodeScanner(),
//                             ),
//                           );
//                         } else if (subLink == 'Order Update') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const OrderUpdate(),
//                             ),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Selected: $subLink')),
//                           );
//                       }}
//                     );
//                   },
//                 ),
//               ).toList(),
//           ),
//         );
//       }
//               return PopupMenuItem<String>(
//                 value: item.toString(),
//                 child: Text(item.toString()),
//               );
//             }).toList(),
//           );
// }

//   Widget _buildSubMenu(BuildContext context, Map<String, dynamic> link) {
//     return PopupMenuButton<String>(
//       offset: const Offset(150, 0), // Adjust the dropdown position to the right
//       child: Padding(
//         padding: const EdgeInsets.only(
//             left: 30.0), // Shift submenu items slightly right
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               link['title'],
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold, // Make the title bold
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   right:
//                       30.0), // Adjust the arrow position slightly to the left
//               child: const Icon(Icons.arrow_right, size: 16),
//             ),
//           ],
//         ),
//       ),
//       onSelected: (value) {
//         if (value == 'Rural Retailer Entry/Update') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const RetailerRegistrationPage2()),
//           );
//         } else if (value == 'Token Scan') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const QrCodeScanner()),
//           );
//         } else if (value == 'Order Update') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const OrderUpdate()),
//           );
//         } else {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('$value clicked')));
//         }
//       },
//       itemBuilder: (context) => link['subLinks']
//           .map<PopupMenuItem<String>>((subLink) => PopupMenuItem<String>(
//                 value: subLink,
//                 child: Text('• $subLink'),
//               ))
//           .toList(),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(70);
// }


// class MenuItem {
//   final String title;
//   final List<String> subLinks;

//   MenuItem({required this.title, required this.subLinks});
// }
