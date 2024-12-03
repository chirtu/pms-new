import 'package:flutter/material.dart';

import '../models/drinks.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;

  const DrinkItem({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: drink.isSelected
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
            : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Circular border radius
              child: SizedBox(
                width: 150,
                height: 80,
                child: Image.asset(
                  drink.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    drink.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text("\$${drink.sellingPrice.toStringAsFixed(2)}", style: const TextStyle(fontSize: 10),),
                ],
              ),
              const Spacer(),
              if(drink.isSelected)
                Container(
                  
                )
            ],
          ),
        ],
      ),
    );
  }
}
