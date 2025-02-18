import 'package:flutter/material.dart';

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
      height: height ?? screenHeight * 0.4,
      width: width ?? screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.002,
        vertical: screenHeight * 0.002,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #123456',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: orderStatuses.length,
                  itemBuilder: (context, index) {
                    final status = orderStatuses[index];
                    final isActive = currentStatus >= status.status;
                    final isLast = index == orderStatuses.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isActive ? Colors.blue : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    status.icon,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                if (!isLast)
                                  Expanded(
                                    child: Container(
                                      width: 2,
                                      color: isActive ? Colors.blue : Colors.grey.shade300,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                  const SizedBox(height: 4),
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
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
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