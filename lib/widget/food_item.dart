import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/foods.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
            boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.4), // Shadow color
                  spreadRadius: 1, 
                  blurRadius: 4, 
                  offset: const Offset(0, 3), 
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 105, // Adjust the height as needed
              child: Image.asset(
                food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${food.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("\$${food.sellingPrice.toStringAsFixed(2)}"),
                  ],
                ),
                const Spacer(),
                food.isSelected
                    ? Container(
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary),
                            child: Icon(Icons.check),
                      )
                    : Icon(Icons.shopping_cart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
