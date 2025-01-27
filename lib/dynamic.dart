import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MenuItem {
  String title;
  List<MenuItem> subLinks;

  MenuItem({required this.title, this.subLinks = const []});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subLinks': subLinks.map((e) => e.toMap()).toList(),
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      title: map['title'] ?? '',
      subLinks: List<MenuItem>.from(
        (map['subLinks'] as List<dynamic>).map<MenuItem>(
          (x) => MenuItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class RoleMenu {
  String roleName;
  List<MenuItem> transactionLinks;
  List<MenuItem> reportLinks;
  List<MenuItem> masterLinks;
  List<MenuItem> miscLinks;

  RoleMenu({
    required this.roleName,
    this.transactionLinks = const [],
    this.reportLinks = const [],
    this.masterLinks = const [],
    this.miscLinks = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'roleName': roleName,
      'transactionLinks': transactionLinks.map((e) => e.toMap()).toList(),
      'reportLinks': reportLinks.map((e) => e.toMap()).toList(),
      'masterLinks': masterLinks.map((e) => e.toMap()).toList(),
      'miscLinks': miscLinks.map((e) => e.toMap()).toList(),
    };
  }

  factory RoleMenu.fromMap(Map<String, dynamic> map) {
    return RoleMenu(
      roleName: map['roleName'] ?? '',
      transactionLinks: List<MenuItem>.from(
        (map['transactionLinks'] as List<dynamic>).map<MenuItem>(
          (x) => MenuItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reportLinks: List<MenuItem>.from(
        (map['reportLinks'] as List<dynamic>).map<MenuItem>(
          (x) => MenuItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      masterLinks: List<MenuItem>.from(
        (map['masterLinks'] as List<dynamic>).map<MenuItem>(
          (x) => MenuItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      miscLinks: List<MenuItem>.from(
        (map['miscLinks'] as List<dynamic>).map<MenuItem>(
          (x) => MenuItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  final String roleName;

  const MenuScreen({super.key, required this.roleName});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late RoleMenu _roleMenu;
  bool _isLoading = true;

  Future<void> _loadMenuData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonMenu = prefs.getString('${widget.roleName}_menu');

  if (jsonMenu != null) {
    setState(() {

      _roleMenu = RoleMenu.fromMap(jsonDecode(jsonMenu));
      _isLoading = false;
    });
  } else {
    // Load default menu data (replace with your default data)
    setState(() {
      _roleMenu = RoleMenu(
        roleName: widget.roleName,
        transactionLinks: [
          MenuItem(title: 'Transaction 1'),
          MenuItem(title: 'Transaction 2'),
        ],
        reportLinks: [
          MenuItem(title: 'Report 1'),
          MenuItem(title: 'Report 2'),
        ],
        masterLinks: [
          MenuItem(title: 'Master 1'),
          MenuItem(title: 'Master 2'),
        ],
        miscLinks: [
          MenuItem(title: 'Misc 1'),
          MenuItem(title: 'Misc 2'),
        ],
      );
      _isLoading = false;
    });
    _saveMenuData(); // Save default data
  }
}



Future<void> _saveMenuData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('${widget.roleName}_menu', jsonEncode(_roleMenu.toMap()));
  // Call the onMenuSaved callback to return the updated menu data
    // widget.onMenuSaved(_roleMenu);
}



  Future<void> _addItem(String section, String title) async {
    setState(() {
      switch (section) {
        case 'Transaction Links':
          _roleMenu.transactionLinks.add(MenuItem(title: title));
          break;
        case 'Report Links':
          _roleMenu.reportLinks.add(MenuItem(title: title));
          break;
        case 'Master Links':
          _roleMenu.masterLinks.add(MenuItem(title: title));
          break;
        case 'Misc Links':
          _roleMenu.miscLinks.add(MenuItem(title: title));
          break;
      }
    });
    _saveMenuData();
  }

  Future<void> _editItem(String section, int index, String title) async {
    setState(() {
      switch (section) {
        case 'Transaction Links':
          _roleMenu.transactionLinks[index].title = title;
          break;
        case 'Report Links':
          _roleMenu.reportLinks[index].title = title;
          break;
        case 'Master Links':
          _roleMenu.masterLinks[index].title = title;
          break;
        case 'Misc Links':
          _roleMenu.miscLinks[index].title = title;
          break;
      }
    });
    _saveMenuData();
  }

  Future<void> _deleteItem(String section, int index) async {
    setState(() {
      switch (section) {
        case 'Transaction Links':
          _roleMenu.transactionLinks.removeAt(index);
          break;
        case 'Report Links':
          _roleMenu.reportLinks.removeAt(index);
          break;
        case 'Master Links':
          _roleMenu.masterLinks.removeAt(index);
          break;
        case 'Misc Links':
          _roleMenu.miscLinks.removeAt(index);
          break;
      }
    });
    _saveMenuData();
  }

  @override
  void initState() {
    super.initState();
    _loadMenuData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.roleName} Menu'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                _buildMenuSection(
                  'Transaction Links',
                  _roleMenu.transactionLinks,
                  _addItem,
                  _editItem,
                  _deleteItem,
                ),
                _buildMenuSection(
                  'Report Links',
                  _roleMenu.reportLinks,
                  _addItem,
                  _editItem,
                  _deleteItem,
                ),
                _buildMenuSection(
                  'Master Links',
                  _roleMenu.masterLinks,
                  _addItem,
                  _editItem,
                  _deleteItem,
                ),
                _buildMenuSection(
                  'Misc Links',
                  _roleMenu.miscLinks,
                  _addItem,
                  _editItem,
                  _deleteItem,
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController controller = TextEditingController();
              return AlertDialog(
                title: const Text('Add New Item'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter Item Title'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      _addItem(
                          'Transaction Links', controller.text.trim()); // Example: Adding to Transaction Links
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
Widget _buildMenuSection(
    String title,
    List<MenuItem> items,
    Function(String, String) addItem,
    Function(String, int, String) editItem,
    Function(String, int) deleteItem,
  ) {
    return ExpansionTile(
      title: Text(title),
      children: [
        for (int i = 0; i < items.length; i++)
          ListTile(
            title: Text(items[i].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    String newTitle = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController controller =
                            TextEditingController(text: items[i].title);
                        return AlertDialog(
                          title: const Text('Edit Item'),
                          content: TextField(
                            controller: controller,
                            decoration: const InputDecoration(hintText: 'Enter Item Title'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                editItem(title, i, controller.text.trim());
                                Navigator.of(context).pop();
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Item'),
                          content: const Text('Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteItem(title, i);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ListTile(
          title: const Text('Add Item'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: const Text('Add New Item'),
                  content: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Enter Item Title'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        addItem(title, controller.text.trim());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}