import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final List<String> subLinks;

  MenuItem({required this.title, required this.subLinks});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json['title'],
      subLinks: List<String>.from(json['subLinks']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subLinks': subLinks,
    };
  }
}





class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? selectedRole;
  final List<String> roles = ['user', 'admin', 'employee'];
  
  // Role-specific menu data
 final Map<String, Map<String, dynamic>> roleMenuData = {
  'admin': {
    'transactionLinks': [
      {
        'title': 'Financial Accounts',
        'subLinks': [
          'Token Scan',
          'Balance Confirmation',
          'Invoice Acknowledgement',
          'Ever White Coupon Generation',
          '194Q Detail Entry',
          'Token Scan Details',
          'Token Scan Report',
          'Token Scan New'
        ]
      },
      {
        'title': 'Depot Order',
        'subLinks': [
          'Secondary Sale Capture',
          'Order Update',
          'Order Entry'
        ]
      },
      {
        'title': 'Retailer',
        'subLinks': [
          'Rural Retailer Entry/Update',
          'Retailer Registration'
        ]
      },
      {
        'title': 'Sales Force',
        'subLinks': [
          'Notification Sent Details',
          'User Rating'
        ]
      },
      {
        'title': 'Mission Udaan',
        'subLinks': [
          'Invoice Cancellation in Bulk',
          'Secondary Sales Invoice Entry'
        ]
      }
    ],
    'reportLinks': [
      {
        'title': 'SAP Reports',
        'subLinks': [
          'Day Summary',
          'Day wise Details',
          'Day Summary Qty/Value Wise',
          'Sales-Purchase-wise Packaging-wise',
          'Year on Year Comparison'
        ]
      },
      {
        'title': 'General Reports',
        'subLinks': [
          'Pending freight report',
          'Account statement',
          'Contact us',
          'Information document'
        ]
      },
      {
        'title': 'MIS Reports',
        'subLinks': ['Purchaser aging report (SAP)']
      },
      {
        'title': 'Sales Reports',
        'subLinks': [
          'Product catg-wise sales',
          'Sales growth overview YTD/MTD'
        ]
      },
      {
        'title': 'Secondary Sale',
        'subLinks': [
          'Stock & RollOut data (Tally)',
          'Secondary Sale (Tally)',
          'Stock Data (Tally)',
          'Retailers Sales Report',
          'Retailer Target Vs Actual',
          'My Network',
          'Tally Data Customer Wise'
        ]
      }
    ],
    'masterLinks': [
      {
        'title': 'Customer',
        'subLinks': [
          'Purchaser Profile',
          'TAN No Update',
          'SAP Invoice Printing'
        ]
      },
      {
        'title': 'Misc Master',
        'subLinks': ['Pin Code Master', 'Profile Photo']
      },
      {
        'title': 'Credit Note',
        'subLinks': ['Guarantor Orc Entry', 'Guarantor Orc View']
      }
    ],
    'miscLinks': ['Change Password', 'Software Download', 'Photo Gallery', 'SMS Query Code Help']
  },
  'user': {
    'transactionLinks': [
      {
        'title': 'Depot Order',
        'subLinks': [
          'Secondary Sale Capture',
          'Order Update',
          'Order Entry'
        ]
      },
      {
        'title': 'Retailer',
        'subLinks': [
          'Rural Retailer Entry/Update',
          'Retailer Registration'
        ]
      }
    ],
    'reportLinks': [
      {
        'title': 'SAP Reports',
        'subLinks': [
          'Day Summary',
          'Day wise Details',
          'Day Summary Qty/Value Wise'
        ]
      },
      {
        'title': 'General Reports',
        'subLinks': [
          'Pending freight report',
          'Account statement'
        ]
      }
    ],
    'masterLinks': [],
    'miscLinks': ['Change Password', 'Software Download']
  }
};

  Map<String, dynamic> get currentMenuData => 
    roleMenuData[selectedRole ?? 'user'] ?? roleMenuData['user']!;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leadingWidth: 150,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          dropdownColor: Colors.blue,
          value: selectedRole ?? 'user',
          hint: const Text(
            'Select Role',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          icon: const Icon(Icons.person, color: Colors.white),
          underline: Container(),
          items: roles.map<DropdownMenuItem<String>>((String role) {
            return DropdownMenuItem<String>(
              value: role,
              child: Text(
                role,
                style: TextStyle(
                  color: selectedRole == role ? Colors.blue : Colors.white,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedRole = newValue;
            });
          },
        ),
      ),
      title: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 200,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMenu(context, 'Transactions', currentMenuData['transactionLinks'] ?? []),
                    _buildMenu(context, 'Reports', currentMenuData['reportLinks'] ?? []),
                    _buildMenu(context, 'Master', currentMenuData['masterLinks'] ?? []),
                    _buildMenu(context, 'Misc', currentMenuData['miscLinks'] ?? []),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: const [],
    );
  }
}
  
 
Widget _buildMenu(BuildContext context, String title, List items) {
  return PopupMenuButton<String>(
    tooltip: title,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    ),
    itemBuilder: (context) => items.map<PopupMenuEntry<String>>((item) {
      if (item is Map<String, dynamic>) {
        return PopupMenuItem<String>(
          child: PopupMenuButton<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item['title']),
                const Icon(Icons.arrow_right, size: 16),
              ],
            ),
            itemBuilder: (context) => 
              (item['subLinks'] as List).map<PopupMenuItem<String>>((subLink) =>
                PopupMenuItem<String>(
                  value: subLink,
                  child: Text(subLink),
                  onTap: () {
                    Future.delayed(
                      const Duration(seconds: 0),
                      () {
                        if (subLink == 'Rural Retailer Entry/Update') {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const RetailerRegistrationApp2(),
                        //     ),
                        //   );
                        // } else if (subLink == 'Token Scan') {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const QrCodeScanner(),
                        //     ),
                        //   );
                        // } else if (subLink == 'Order Update') {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const OrderUpdate(),
                        //     ),
                        //   );
                        // } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Selected: $subLink')),
                          );
                    }}
                    );
                  },
                ),
              ).toList(),
          ),
        );
      }
              return PopupMenuItem<String>(
                value: item.toString(),
                child: Text(item.toString()),
              );
            }).toList(),
          );
}


Widget _buildMenuWithMouseRegion(BuildContext context, String title, List items) {
  return MouseRegion(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PopupMenuButton<String>(
        tooltip: title,
        position: PopupMenuPosition.under,
        offset: const Offset(0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
        itemBuilder: (context) => items.map<PopupMenuEntry<String>>((item) {
          if (item is Map<String, dynamic>) {
            return PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title']),
                  if ((item['subLinks'] as List).isNotEmpty)
                    const Icon(Icons.arrow_right, size: 16),
                ],
              ),
            );
          }
          return PopupMenuItem<String>(
            value: item.toString(),
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    ),
  );
}
    void _showSubMenu(BuildContext context, List subLinks) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: subLinks.map<Widget>((subLink) {
            return ListTile(
              title: Text(subLink),
              onTap: () {
                Navigator.pop(context);
                if (subLink == 'Rural Retailer Entry/Update') {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const RetailerRegistrationApp2(),
                //     ),
                //   );
                // } else if (subLink == 'Token Scan') {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const QrCodeScanner(),
                //     ),
                //   );
                // } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $subLink')),
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


class MenuModel {
  final String roleName;
  final List<MenuItem> transactionLinks;
  final List<MenuItem> reportLinks;
  final List<MenuItem> masterLinks;
  final List<String> miscLinks;

  MenuModel({
    required this.roleName,
    required this.transactionLinks,
    required this.reportLinks,
    required this.masterLinks,
    required this.miscLinks,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      roleName: json['roleName'],
      transactionLinks: List<MenuItem>.from(
          json['transactionLinks'].map((x) => MenuItem.fromJson(x))),
      reportLinks: List<MenuItem>.from(
          json['reportLinks'].map((x) => MenuItem.fromJson(x))),
      masterLinks: List<MenuItem>.from(
          json['masterLinks'].map((x) => MenuItem.fromJson(x))),
      miscLinks: List<String>.from(json['miscLinks']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roleName': roleName,
      'transactionLinks': transactionLinks.map((x) => x.toJson()).toList(),
      'reportLinks': reportLinks.map((x) => x.toJson()).toList(),
      'masterLinks': masterLinks.map((x) => x.toJson()).toList(),
      'miscLinks': miscLinks,
    };
  }
}



class MenuData {
  static final Map<String, dynamic> data = {
    "roleName": "admin",
    "transactionLinks": [
      MenuItem(
        title: "Financial Accounts",
        subLinks: [
          "Token Scan",
          "Balance Confirmation",
          "Invoice Acknowledgement",
          "Ever White Coupon Generation",
          "194Q Detail Entry",
          "Token Scan Details",
          "Token Scan Report",
          "Token Scan New"
        ],
      ),
      MenuItem(
        title: "Depot Order",
        subLinks: [
          "Secondary Sale Capture",
          "Order Update",
          "Order Entry"
        ],
      ),
      MenuItem(
        title: "Retailer",
        subLinks: [
          "Rural Retailer Entry/Update",
          "Retailer Registration"
        ],
      ),
      MenuItem(
        title: "Sales Force",
        subLinks: [
          "Notification Sent Details",
          "User Rating"
        ],
      ),
      MenuItem(
        title: "Mission Udaan",
        subLinks: [
          "Invoice Cancellation in Bulk",
          "Secondary Sales Invoice Entry"
        ],
      ),
    ],
    "reportLinks": [
      MenuItem(
        title: "SAP Reports",
        subLinks: [
          "Day Summary",
          "Day wise Details",
          "Day Summary Qty/Value Wise",
          "Sales-Purchase-wise Packaging-wise",
          "Year on Year Comparison"
        ],
      ),
      MenuItem(
        title: "General Reports",
        subLinks: [
          "Pending freight report",
          "Account statement",
          "Contact us",
          "Information document"
        ],
      ),
      MenuItem(
        title: "MIS Reports",
        subLinks: [
          "Purchaser aging report (SAP)"
        ],
      ),
      MenuItem(
        title: "Sales Reports",
        subLinks: [
          "Product catg-wise sales",
          "Sales growth overview YTD/MTD"
        ],
      ),
      MenuItem(
        title: "Scheme/Discount",
        subLinks: [
          "Purchaser and retailer disbursement details",
          "RPL Outlet tracker",
          "Scheme Disbursement View"
        ],
      ),
      MenuItem(
        title: "Retailer",
        subLinks: [
          "Retailer report",
          "Retailer KYC details"
        ],
      ),
      MenuItem(
        title: "Chart Reports",
        subLinks: [
          "Sales overview"
        ],
      ),
      MenuItem(
        title: "Mobile Reports",
        subLinks: [
          "Purchaser 360"
        ],
      ),
      MenuItem(
        title: "Secondary Sale",
        subLinks: [
          "Stock & RollOut data (Tally)",
          "Secondary Sale (Tally)",
          "Stock Data (Tally)",
          "Retailers Sales Report",
          "Retailer Target Vs Actual",
          "My Network",
          "Tally Data Customer Wise"
        ],
      ),
      MenuItem(
        title: "Scheme Details",
        subLinks: [
          "Schemes Summary"
        ],
      ),
    ],
    "masterLinks": [
      MenuItem(
        title: "Customer",
        subLinks: [
          "Purchaser Profile",
          "TAN No Update",
          "SAP Invoice Printing"
        ],
      ),
      MenuItem(
        title: "Misc Master",
        subLinks: [
          "Pin Code Master",
          "Profile Photo"
        ],
      ),
      MenuItem(
        title: "Credit Note",
        subLinks: [
          "Guarantor Orc Entry",
          "Guarantor Orc View"
        ],
      ),
    ],
    "miscLinks": [
      "Change Password",
      "Software Download",
      "Photo Gallery",
      "SMS Query Code Help"
    ]
  };
}