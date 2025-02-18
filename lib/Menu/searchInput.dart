import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  final logger = Logger();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Add FocusNode
  
  final List<String> _allItems = [
    'Token Scan',
    'Balance Confirmation',
    'Invoice Acknowledgement',
    'Ever White Coupon Generation',
    '194Q Detail Entry',
    'Token Scan Details',
    'Token Scan Report',
    'Token Scan New',
  ];
  List<String> _filteredItems = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    _searchController.addListener(_onSearchChanged);
  }

 void _onSearchChanged() {
  if (!mounted) return;
  
  final searchText = _searchController.text.toLowerCase();
  
  // Debounce the search to prevent UI freezing
  Future.microtask(() {
    if (mounted) {
      setState(() {
        _isSearching = searchText.isNotEmpty;
        _filteredItems = searchText.isEmpty 
            ? _allItems 
            : _allItems
                .where((item) => item.toLowerCase().contains(searchText))
                .toList();
      });
    }
  });
}

  void _onItemSelected(String item) {
    if (!mounted) return; // Add mounted check
    
    logger.i('Selected Item: $item');
    _searchController.text = item;
    _focusNode.unfocus(); // Unfocus when item is selected
    setState(() {
      _isSearching = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose(); // Dispose focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  focusNode: _focusNode, // Add focus node
                  decoration: InputDecoration(
                    hintText: 'Search for reports, orders, etc.',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _focusNode.unfocus(); // Unfocus when cleared
                              setState(() {
                                _isSearching = false;
                                _filteredItems = _allItems;
                              });
                            },
                          )
                        : null,
                  ),
                  cursorColor: Colors.blueGrey,
                ),
                if (_isSearching && _filteredItems.isNotEmpty)
                  Material( // Wrap with Material widget
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      margin: const EdgeInsets.only(top: 4),
                      constraints: const BoxConstraints(maxHeight: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          return InkWell( // Replace ListTile with InkWell
                            onTap: () => _onItemSelected(_filteredItems[index]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Text(
                                _filteredItems[index],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
