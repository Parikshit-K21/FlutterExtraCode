import 'package:dynaa/orderDet/orderTrack.dart';
import 'package:dynaa/ordershow/globitems.dart';
import 'package:flutter/material.dart';
import 'eachOrder.dart';

class OrderDetails extends StatelessWidget {
  final int index;

  const OrderDetails({
    super.key, 
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Get the specific order from orderItems
    final order = orderItems[index];
    
    // Convert status to int, default to 1 if parsing fails
    final orderStatus = int.tryParse(order['status'].toString()) ?? 1;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Tracking Widget
              OrderTrackingWidget(
                currentStatus: orderStatus, // Pass the parsed status
              ),
              
              // Order Summary Card
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderInfoRow(
                        'Order Number:',
                        '#${order['orderNumber'] ?? ''}',
                        Icons.receipt_long,
                      ),
                      const Divider(),
                      _buildOrderInfoRow(
                        'Status:',
                        _getStatusText(orderStatus),
                        Icons.pending_actions,
                        valueColor: _getStatusColor(orderStatus),
                      ),
                      const Divider(),
                      _buildOrderInfoRow(
                        'Placed Date:',
                        order['place date'] ?? 'N/A',
                        Icons.calendar_today,
                      ),
                    ],
                  ),
                ),
              ),

              // Product Details Card
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Product Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // List all products in the order
                      ...orderProductsItems.map((item) => Column(
                        children: [
                          _buildProductItem(
                            productName: item['productName'] ?? '',
                            quantity: int.tryParse(item['productQty'] ?? '0') ?? 0,
                            totalPrice: double.tryParse(item['productTotalPrice'] ?? '0') ?? 0,
                          ),
                          const Divider(),
                        ],
                      )).toList(),
                      _buildTotalSection(),
                    ],
                  ),
                ),
              ),

              // Buttons Section (Only shown if order is delivered)
              if (orderStatus == 3)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _handleContactUs(context),
                          icon: const Icon(Icons.contact_support),
                          label: const Text('Contact Us'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _handleInvoiceDownload(context, order['orderId'] ?? ''),
                          icon: const Icon(Icons.download),
                          label: const Text('Invoice'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return 'Order Placed';
      case 2:
        return 'Processing';
      case 3:
        return 'Delivered';
      default:
        return 'Unknown';
    }
  }

  Color _getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.blue;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildOrderInfoRow(String label, String value, IconData icon, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem({
    required String productName,
    required int quantity,
    required double totalPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.inventory_2,
              color: Colors.blue,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Quantity: $quantity',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    double total = orderProductsItems.fold(0, (sum, item) => 
      sum + (double.tryParse(item['productTotalPrice'] ?? '0') ?? 0));
    
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleContactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Support'),
        content: const Text('Our support team will assist you shortly.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _handleInvoiceDownload(BuildContext context, String orderId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading invoice for order #$orderId...'),
      ),
    );
  }
}
