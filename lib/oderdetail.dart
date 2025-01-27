import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Order',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildOrderItem(
                'Baseus TWS Earphone',
                '1',
                '€120',
                'assets/earphone.png', // Replace with actual image path
              ),
              const SizedBox(height: 16.0),
              _buildOrderItem(
                'Humidifier\nSmart Home Acc',
                '1',
                '€120',
                'assets/humidifier.png', // Replace with actual image path
              ),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[100],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.delivery_dining, size: 24.0),
                            SizedBox(width: 8.0),
                            Text(
                              'DHL 44180',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '2904 3234 2424',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ferra Alexandra'),
                        Text('21 Marynarska St'),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text('Recipient'),
                    SizedBox(height: 12.0),
                    Text('Address'),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              _buildSummaryRow('Product:', '240'),
              _buildSummaryRow('Shipment:', '€13'),
              _buildSummaryRow('Tax 10%:', '€24'),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '€277.00',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, String quantity, String price, String imagePath) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 50.0,
          height: 50.0,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text('Qty: $quantity'),
                  const SizedBox(width: 16.0),
                  Text('Price: $price'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}