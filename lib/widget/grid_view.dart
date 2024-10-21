import 'package:flutter/material.dart';
import 'package:pms_app/models/order.dart';
import '../widget/food_item.dart';
import '../widget/drinks_item.dart';

class GridDisplay extends StatefulWidget {
  final String type;

  const GridDisplay({Key? key, required this.type}) : super(key: key);

  @override
  _GridDisplayState createState() => _GridDisplayState();
}

class _GridDisplayState extends State<GridDisplay> {
  void _showQuantityDialog(String itemName, Function(int) onUpdate) {
    int quantity = 1; // Default quantity

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF663202),
          title: Text('Select Quantity for $itemName',
              style: TextStyle(
                fontSize: 12,
              )),
          content: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Quantity'),
                  onChanged: (value) {
                    quantity = int.tryParse(value) ?? 1;
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                onUpdate(quantity);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount:
          widget.type == 'food' ? dummyFoodList.length : dummyDrinksList.length,
      itemBuilder: (context, index) {
        if (widget.type == 'food') {
          final food = dummyFoodList[index];
          return GestureDetector(
            onTap: () {
              if (food.isSelected) {
                // If already selected, show quantity dialog
                _showQuantityDialog(food.name, (quantity) {
                  setState(() {
                    food.boughtQuantity = quantity; // Update quantity
                  });
                });
              } else {
                // Toggle selection
                setState(() {
                  food.isSelected = true; // Mark as selected
                });
                _showQuantityDialog(food.name, (quantity) {
                  setState(() {
                    food.boughtQuantity = quantity; // Set quantity
                  });
                });
              }
            },
            child: GridTile(
              child: FoodItem(food: food),
              footer: food.isSelected
                  ? Text('Quantity: ${food.boughtQuantity}') // Show quantity
                  : null,
            ),
          );
        }
        if (widget.type == 'drink') {
          final drink = dummyDrinksList[index];
          return GestureDetector(
            onTap: () {
              if (drink.isSelected) {
                // If already selected, show quantity dialog
                _showQuantityDialog(drink.name, (quantity) {
                  setState(() {
                    drink.boughtQuantity = quantity; // Update quantity
                  });
                });
              } else {
                // Toggle selection
                setState(() {
                  drink.isSelected = true; // Mark as selected
                });
                _showQuantityDialog(drink.name, (quantity) {
                  setState(() {
                    drink.boughtQuantity = quantity; // Set quantity
                  });
                });
              }
            },
            child: GridTile(
              child: DrinkItem(drink: drink),
              footer: drink.isSelected
                  ? Text('Quantity: ${drink.boughtQuantity}') // Show quantity
                  : null,
            ),
          );
        }
      },
    );
  }
}
