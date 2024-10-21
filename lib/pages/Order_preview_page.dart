import 'package:flutter/material.dart';
import '../models/drinks.dart';
import '../models/order.dart';
import '../models/foods.dart';

class OrderPreviewPage extends StatefulWidget {
  final List<Order> selectedItems;
  final Function? resetSelectionsCallback;
  final int? tableNumber;

  const OrderPreviewPage({
    Key? key,
    required this.selectedItems,
    this.resetSelectionsCallback,
    this.tableNumber,
  }) : super(key: key);

  @override
  _OrderPreviewPage createState() => _OrderPreviewPage();
}

class _OrderPreviewPage extends State<OrderPreviewPage> {
  late Order combinedOrder;

  @override
  void initState() {
    super.initState();
    combinedOrder = _combineOrders(widget.selectedItems);
    print('----------');
    print(widget.selectedItems.toString());
  }

  Order _combineOrders(List<Order> orders) {
    int totalQuantity = 0;
    double totalCost = 0.0;
    List<Food> combinedFoods = [];
    List<Drink> combinedDrinks = [];

    for (var order in orders) {
      totalQuantity += order.totalBoughtQuantity;
      totalCost += order.totalCost ?? 0.0;
      if (order.foods != null) {
        combinedFoods.addAll(order.foods!);
      }
      if (order.drinks != null) {
        combinedDrinks.addAll(order.drinks!);
      }
    }

    return Order(
      tableId: widget.tableNumber.toString(),
      // totalBoughtQuantity: totalQuantity,
      totalCost: totalCost,
      foods: combinedFoods,
      drinks: combinedDrinks,
    );
  } 

  void _editQuantity(Food item) {
    int newQuantity = item.boughtQuantity;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Quantity for ${item.name}"),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => newQuantity = int.tryParse(value) ?? item.boughtQuantity,
            decoration: const InputDecoration(labelText: "Quantity"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => item.boughtQuantity = newQuantity);
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _removeItem(Food item) {
    setState(() => combinedOrder.foods?.remove(item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Order table ${widget.tableNumber}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: combinedOrder.foods?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = combinedOrder.foods![index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    margin: EdgeInsets.all(4),
                    child: ListTile(
                      title: Text('${item.name}'),
                      subtitle: Text(
                        "Quantity: ${item.boughtQuantity}",
                        style: const TextStyle(fontSize: 10),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _editQuantity(item);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeItem(item),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Cost:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "Tsh ${combinedOrder.totalCost?.toStringAsFixed(2) ?? '0.00'}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
                widget.resetSelectionsCallback?.call();
              },
              child: Text("Confirm Order"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}