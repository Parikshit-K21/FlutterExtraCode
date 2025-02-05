import 'package:flutter/material.dart';
import 'package:advanced_search/advanced_search.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 254, 254, 255),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 4),
            SizedBox(
              width: 400,
              child: AdvancedSearch(
               
                maxElementsToDisplay: 5, // Adjust based on your needs
                onItemTap: (context,items) {
                  // Handle item tap
                  final selectedItem = items[context];
                  print('Selected Item: $selectedItem'); // Replace with your logic
                },
                onSearchClear: () {
                  // Handle search clear
                  print('Search cleared');
                },
                onSubmitted: (value,items) {
                  // Handle submitted search
                  print('Search submitted: $value');
                },
                onEditingProgress: (value,items) {
                  // Handle editing progress if needed
                  print('Editing progress: $value');
                },
                hintText: 'Search for reports, orders, etc.',
                borderColor: Colors.grey,
                singleItemHeight: 50,
                borderRadius: 12.0,
                cursorColor: Colors.blueGrey,
                focusedBorderColor: Colors.blue,
                enabledBorderColor: Colors.white, searchItems: items,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
