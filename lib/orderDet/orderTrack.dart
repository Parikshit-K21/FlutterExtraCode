import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class OrderTrackingWidget extends StatelessWidget {
  final int currentStatus;
  final double? height;
  final double? width;

  const OrderTrackingWidget({
    Key? key,
    required this.currentStatus,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final List<OrderStatus> orderStatuses = [
      OrderStatus(
        title: "Order Placed",
        subtitle: "Your order has been received",
        status: 1,
        icon: Icons.shopping_cart,
      ),
      OrderStatus(
        title: "Processing",
        subtitle: "Your order is being prepared",
        status: 2,
        icon: Icons.inventory,
      ),
      
      OrderStatus(
        title: "Delivered",
        subtitle: "Order has been delivered",
        status: 3,
        icon: Icons.check_circle,
      ),
    ];

    return Container(
      height: height ?? screenHeight * 0.5, // Adjustable height
      width: width ?? screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Order ID and Date Section
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #123456',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
              ),

              // Timeline Section
              Expanded(
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    connectorTheme: const ConnectorThemeData(
                      thickness: 2.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * 0.01,
                    horizontal: constraints.maxWidth * 0.01,
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemCount: orderStatuses.length,
                    contentsBuilder: (_, index) {
                      final status = orderStatuses[index];
                      final isActive = currentStatus >= status.status;
                      
                      return Padding(
                        padding: const  EdgeInsets.only(
                          top: 20,
                          left: 10,
                          bottom: 10 ,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              status.title,
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: isActive ? Colors.blue : Colors.grey,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Text(
                              status.subtitle,
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035,
                                color: isActive 
                                    ? const Color.fromARGB(255, 27, 81, 126).withOpacity(0.7) 
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    indicatorBuilder: (_, index) {
                      final status = orderStatuses[index];
                      final isActive = currentStatus >= status.status;
                      
                      return Container(
                        width: constraints.maxWidth * 0.12,
                        height: constraints.maxWidth * 0.12,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          status.icon,
                          color: Colors.white,
                          size: constraints.maxWidth * 0.045,
                        ),
                      );
                    },
                    connectorBuilder: (_, index, type) {
                      final status = orderStatuses[index];
                      final isActive = currentStatus >= status.status;
                      
                      return SolidLineConnector(
                        color: isActive ? Colors.blue : Colors.grey.shade300,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

class OrderStatus {
  final String title;
  final String subtitle;
  final int status;
  final IconData icon;

  OrderStatus({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
  });
}
