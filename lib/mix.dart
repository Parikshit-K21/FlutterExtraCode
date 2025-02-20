import 'package:dynaa/product/pending.dart';
import 'package:dynaa/product/popularItems.dart';
import 'package:flutter/material.dart';

class MixCon extends StatelessWidget {
  const MixCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PendingTasksList(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PopularProducts(),
          ),
        ],
      ),
    );
  }
}
