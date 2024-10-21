import 'package:flutter/material.dart';

import '../models/drinks.dart';

List<Drink> dummyDrinksList = [
  Drink(
    id: 'd1',
    name: "Coca-Cola",
    buyingPrice: 0.5,
    sellingPrice: 1.0,
    unit: 330,
    stockQuantity: 100,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd2',
    name: "Pepsi",
    buyingPrice: 0.45,
    sellingPrice: 0.95,
    unit: 330,
    stockQuantity: 150,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd3',
    name: "Fanta",
    buyingPrice: 0.55,
    sellingPrice: 1.05,
    unit: 330,
    stockQuantity: 120,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd4',
    name: "Fanta",
    buyingPrice: 0.55,
    sellingPrice: 1.05,
    unit: 330,
    stockQuantity: 120,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd5',
    name: "Coca Cola",
    buyingPrice: 0.60,
    sellingPrice: 1.10,
    unit: 330,
    stockQuantity: 100,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd6',
    name: "Pepsi",
    buyingPrice: 0.50,
    sellingPrice: 1.00,
    unit: 330,
    stockQuantity: 150,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd7',
    name: "Sprite",
    buyingPrice: 0.55,
    sellingPrice: 1.05,
    unit: 330,
    stockQuantity: 130,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd8',
    name: "7 Up",
    buyingPrice: 0.60,
    sellingPrice: 1.10,
    unit: 330,
    stockQuantity: 140,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd9',
    name: "Dr Pepper",
    buyingPrice: 0.65,
    sellingPrice: 1.15,
    unit: 330,
    stockQuantity: 160,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd10',
    name: "Mountain Dew",
    buyingPrice: 0.70,
    sellingPrice: 1.20,
    unit: 330,
    stockQuantity: 170,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd11',
    name: "Sprite",
    buyingPrice: 0.5,
    sellingPrice: 1.0,
    unit: 330,
    stockQuantity: 130,
    imageUrl: 'assets/images/drinks.png',
  ),
  Drink(
    id: 'd12',
    name: "Mountain Dew",
    buyingPrice: 0.6,
    sellingPrice: 1.2,
    unit: 330,
    stockQuantity: 110,
    imageUrl: 'assets/images/drinks.png',
  ),
];

class DrinkItem extends StatelessWidget {
  final Drink drink;

  const DrinkItem({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: drink.isSelected
          ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
          : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              child: Image.asset(
                drink.imageUrl,
                fit: BoxFit.cover,
              ),      
            ),
          ),
          Text(
            drink.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("\$${drink.sellingPrice.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}
