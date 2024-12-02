import 'package:flutter/material.dart';

import '../models/foods.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: food.isSelected
            ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
            : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: SizedBox(
              width: 150, // Adjust the width as needed
              height: 90, // Adjust the height as needed
              child: Image.asset(
                food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${food.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (food.isSelected) Text('Qty ${food.boughtQuantity}x      '),
            ],
          ),
          Text("\$${food.sellingPrice.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}
