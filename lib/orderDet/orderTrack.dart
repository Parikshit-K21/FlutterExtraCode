import 'package:dynaa/orderDet/oderdetailAI.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineItem {
  final String title;
  final String subtitle;
  final Color color;
  final Widget icon;
  final bool isDashed;

  TimelineItem(
    this.title, {
    required this.color,
    required this.icon,
    required this.subtitle,
    this.isDashed = false,
  });
}

class OrderTimelineScreen extends StatelessWidget {
  const OrderTimelineScreen({super.key, required this.n});
  final int n;


  @override
  Widget build(BuildContext context) {

    TextEditingController searchController = TextEditingController();
    
    final List<TimelineItem> items = [
      TimelineItem(
        "Order Placed",
        subtitle: "Your order has been received",
        color: Colors.green,
        icon: const Icon(Icons.shopping_cart, color: Colors.white, size: 20),
      ),
      TimelineItem(
        "In Progress",
        subtitle: "Your order is being processed",
        color: Colors.orange,
        icon: const Icon(Icons.hourglass_empty, color: Colors.white, size: 20),
        isDashed: getIsDashed(n),
      ),
      TimelineItem(
        "Completed",
        subtitle: getIsDashed(n) ? "" : "Order has been delivered",
        color: getIsDashed(n) ? Colors.grey:Colors.red,
        icon: const Icon(Icons.check_circle, color: Colors.white, size: 20),
        isDashed: getIsDashed(n),
      ),
    ];


  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Flexible(  // Wrap Timeline in Expanded
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0.03,
              connectorTheme: const ConnectorThemeData(thickness: 2.5),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.after,
              itemCount: items.length,
              contentsBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].title,
                      style: TextStyle(
                        color: items[index].color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index].subtitle,
                      style: TextStyle(
                        color: items[index].color.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              indicatorBuilder: (_, index) => DotIndicator(
                color: items[index].color,
                child: items[index].icon,
              ),
              connectorBuilder: (_, index, type) => items[index].isDashed
                  ? DashedLineConnector(color: items[index].color)
                  : SolidLineConnector(color: items[index].color),
            ),
          ),
        ),
      ],
    ),
  );
}


  bool getIsDashed(n) {
    if (n == 1 || n == 3) {
      return true; // Only "In Progress" is dashed
    } else if (n == 2) {
      return false; // Only "Completed" is dashed
    }
    return true; // For status 3, nothing is dashed
  }


  
}
class SearchInputFb1 extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const SearchInputFb1({required this.searchController,required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.center,
        onChanged: (value){},
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.email),
          prefixIcon:
              const Icon(Icons.search, size: 20, color: Color(0xffFF5A60)),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
