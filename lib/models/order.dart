import 'foods.dart';
import 'drinks.dart';

class Order {
  final String? tableId;
  final List<Food>? foods;
  final List<Drink>? drinks;
  double? totalCost;

  Order({
    this.tableId,
    this.drinks,
    this.foods, 
    this.totalCost,
  });

    @override
  String toString() {
    return 'Order{tableId: $tableId, totalCost: $totalCost, totalBoughtQuantity: $totalBoughtQuantity, foods: $foods}';
  }

  // Calculate total bought quantity
  int get totalBoughtQuantity {
    int foodQuantity = foods?.fold(0, (sum, item) => sum! + item.boughtQuantity) ?? 0;
    int drinkQuantity = drinks?.fold(0, (sum, item) => sum! + item.boughtQuantity) ?? 0;
    return foodQuantity + drinkQuantity;
  }

  // Calculate the total cost
  void calculateTotalCost() {
    totalCost = (foods?.fold(0.0, (sum, food) => sum! + (food.boughtQuantity * food.sellingPrice)) ?? 0) +
                (drinks?.fold(0.0, (sum, drink) => sum! + (drink.boughtQuantity * drink.sellingPrice)) ?? 0);
  }
}
