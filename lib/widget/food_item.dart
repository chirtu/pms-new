import 'package:flutter/material.dart';

import '../models/foods.dart';

List<Food> dummyFoodList = [
  Food(
    id: 'f1',
    name: 'Burger',
    imageUrl: 'assets/images/drinks.png',
    description:
        'A juicy grilled beef burger with lettuce, tomato, and cheese.',
    servedWith: 'Served with fries and ketchup',
    sellingPrice: 5.99,
  ),
  Food(
    id: 'f2',
    name: 'Pizza',
    imageUrl: 'assets/images/drinks.png',
    description: 'Classic Margherita pizza with mozzarella cheese and basil.',
    servedWith: 'Served with garlic sauce',
    sellingPrice: 8.99,
  ),
  Food(
    id: 'f3',
    name: 'Pasta',
    imageUrl: 'assets/images/drinks.png',
    description: 'Creamy Alfredo pasta with chicken and mushrooms.',
    servedWith: 'Served with garlic bread',
    sellingPrice: 7.50,
  ),
  Food(
    id: 'f4',
    name: 'Sushi',
    imageUrl: 'assets/images/drinks.png',
    description: 'Fresh salmon and tuna sushi rolls with avocado and cucumber.',
    servedWith: 'Served with soy sauce and wasabi',
    sellingPrice: 12.99,
  ),
  Food(
    id: 'f5',
    name: 'Salad',
    imageUrl: 'assets/images/drinks.png',
    description:
        'Fresh garden salad with lettuce, tomato, cucumber, and feta cheese.',
    servedWith: 'Served with balsamic vinaigrette',
    sellingPrice: 6.00,
  ),
  Food(
    id: 'f6',
    name: 'Steak',
    imageUrl: 'assets/images/drinks.png',
    description: 'Grilled ribeye steak with a side of mashed potatoes.',
    servedWith: 'Served with peppercorn sauce',
    sellingPrice: 15.50,
  ),
  Food(
    id: 'f7',
    name: 'Taco',
    imageUrl: 'assets/images/drinks.png',
    description: 'Soft tortilla filled with spicy beef, lettuce, and cheese.',
    servedWith: 'Served with salsa and guacamole',
    sellingPrice: 3.25,
  ),
  Food(
    id: 'f8',
    name: 'Hot Dog',
    imageUrl: 'assets/images/drinks.png',
    description: 'Classic hot dog with mustard, ketchup, and relish.',
    servedWith: 'Served with a side of fries',
    sellingPrice: 4.50,
  ),
  Food(
    id: 'f9',
    name: 'Chicken Wings',
    imageUrl: 'assets/images/drinks.png',
    description: 'assets/images/drinks.png',
    servedWith: 'Served with ranch dip',
    sellingPrice: 6.75,
  ),
  Food(
    id: 'f10',
    name: 'Doughnut',
    imageUrl: 'assets/images/drinks.png',
    description: 'Glazed doughnut with a soft and fluffy texture.',
    servedWith: 'Served with coffee',
    sellingPrice: 1.50,
  ),
];

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
          Container(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Circular border radius
              child: SizedBox(
                width: 150, // Adjust the width as needed
                height: 90, // Adjust the height as needed
                child: Image.asset(
                  food.imageUrl,
                  fit: BoxFit.cover,
                ),
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
