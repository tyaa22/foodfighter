import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodfighter/models/food.dart';

class MyQuantityControl extends StatelessWidget {

  final Food food;
  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQuantityControl({
    super.key,
    required this.food,
    required this.qty,
    required this.onIncrement,
    required this.onDecrement
});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //decrease button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          //qty count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                  child: Text(qty.toString())),
            ),
          ),

          //increase button
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
  
}