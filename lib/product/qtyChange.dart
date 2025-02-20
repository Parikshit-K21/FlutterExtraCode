import 'package:flutter/material.dart';

class NumberOfItems extends StatefulWidget {
  final Function(int) onQuantityChanged; // Callback for quantity changes
  final int initialQuantity;

  const NumberOfItems({
    Key? key,
    required this.onQuantityChanged,
    this.initialQuantity = 1,
  }) : super(key: key);

  @override
  State<NumberOfItems> createState() => _NumberOfItemsState();
}

class _NumberOfItemsState extends State<NumberOfItems> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.blue,),
            onPressed: () {
              if (qty > 1) {
                setState(() {
                  qty--;
                });
                widget.onQuantityChanged(qty);
              }
            },
          ),
          Text('$qty'),
          IconButton(
            icon: const Icon(Icons.add,color: Colors.blue,),
            onPressed: () {
              setState(() {
                qty++;
              });
              widget.onQuantityChanged(qty);
            },
          ),
        ],
      ),
    );
  }
}
