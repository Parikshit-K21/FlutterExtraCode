import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController searchController = TextEditingController();
  final List<String> items = [
    'Token Scan',
    'Balance Confirmation',
    'Invoice Acknowledgement',
    'Ever White Coupon Generation',
    '194Q Detail Entry',
    'Token Scan Details',
    'Token Scan Report',
    'Token Scan New',
  ];
  
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, all items are displayed
    filteredItems = items;
  }

  void _filterSearchResults(String query) {
    if (query.isNotEmpty) {
      // Filter the items based on the query
      setState(() {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      // If the query is empty, show all items
      setState(() {
        filteredItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.1),
        ),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: searchController,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              prefixIcon:
                  const Icon(Icons.search, size: 20, color: Colors.blue),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for reports, orders, etc.',
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(.40)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(15.0))),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white, width: 1.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(15.0))),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white, width: 2.0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(15.0))),
            ),
            onChanged: _filterSearchResults, // Call filter method on change
          ),
          const SizedBox(height: 10), // Space between text field and results
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                  onTap: () {
                    // Handle item tap - navigate to results page or perform action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsPage(query: filteredItems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({Key? key, required this.query}) : super(key: key);

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
