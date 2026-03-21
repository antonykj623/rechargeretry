import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final int min;
  final int max;
  final Function(int) onChanged;

  const QuantitySelector({
    Key? key,
    this.initialValue = 1,
    this.min = 1,
    this.max = 10,
    required this.onChanged,
  }) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialValue;
  }

  void increment() {
    if (quantity < widget.max) {
      setState(() {
        quantity++;
      });
      widget.onChanged(quantity);
    }
  }

  void decrement() {
    if (quantity > widget.min) {
      setState(() {
        quantity--;
      });
      widget.onChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // ➖ Button
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: decrement,
          ),

          // Quantity Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              quantity.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // ➕ Button
          IconButton(
            icon: Icon(Icons.add),
            onPressed: increment,
          ),
        ],
      ),
    );
  }
}