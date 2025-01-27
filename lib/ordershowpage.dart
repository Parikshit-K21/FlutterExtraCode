import 'package:flutter/material.dart';

class Ordershowpage extends StatelessWidget {
  const Ordershowpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user_image.png'), // Replace with actual image path
                  radius: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jessica',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on),
                Text('Manhattan, NY'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Shipment History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All'),
                Text('Pending Delivery'),
                Text('Completed Delivery'),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with actual data count
                itemBuilder: (context, index) {
                  return _buildShipmentCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShipmentCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tracking Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: index == 0
                        ? Colors.orange // Adjust colors as needed
                        : index == 1
                            ? Colors.red
                            : Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    index == 0
                        ? 'Pending'
                        : index == 1
                            ? 'Return'
                            : 'Completed',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('#${index + 1}2345678'), // Example tracking number
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 5),
                Text('47 W 13th St, New York, NY'),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 5),
                Text('20 Cooper Square, New York, NY'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('11/16/2024'),
                Text('11/18/2012'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}