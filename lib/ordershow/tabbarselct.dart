import 'package:dynaa/ordershow/globitems.dart';
import 'package:dynaa/ordershow/shipMentCard.dart';
import 'package:flutter/material.dart';


class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> getTabPairs() {
  final pendingItems = orderItems.where((item) => item['status'] == '1').toList();
  final completedItems = orderItems.where((item) => item['status'] != '1').toList();

  return [
    TabPair(
      tab: const Tab(
        text: 'Pending ',
      ),
      view: ListView.builder(
        itemCount: pendingItems.length,
        itemBuilder: (context, index) => buildShipmentCard(context, index, pendingItems),
      ),
    ),
    TabPair(
      tab: const Tab(
        text: 'Completed Orders',
      ),
      view: ListView.builder(
        itemCount: completedItems.length,
        itemBuilder: (context, index) => buildShipmentCard(context, index, completedItems),
      ),
    ),
  ];
}

class TabBarAndTabViews extends StatefulWidget {
  const TabBarAndTabViews({super.key});

  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: getTabPairs().length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.white,
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: const BoxDecoration(
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                      right: Radius.circular(100),
                    ),
                    color: Colors.blue,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: getTabPairs().map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: getTabPairs().map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
    
}