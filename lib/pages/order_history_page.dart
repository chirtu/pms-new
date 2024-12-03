import 'package:flutter/material.dart';
import 'package:pms_app/Lists/order_list.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: dummyOrders.length,
        itemBuilder: (context, index) {
          final order = dummyOrders[index];
          return _buildOrderCard(order, context);
        },
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
           boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.4), // Shadow color
                  spreadRadius: 1, 
                  blurRadius: 4, 
                  offset: const Offset(0, 3), 
                ),
              ],
       ),
      child: ExpansionTile(
        title: Text(
          "Table ${order.tableId}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle: Text(
          "Total Cost: Tsh ${_calculateTotalCost(order.items).toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 14),
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              final item = order.items[index];
              return _buildItemTile(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemTile(OrderItem item) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(
        "Quantity: ${item.quantity} - Tsh ${item.sellingPrice.toStringAsFixed(2)}",
      ),
      trailing: Text(
        "Tsh ${(item.quantity * item.sellingPrice).toStringAsFixed(2)}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  double _calculateTotalCost(List<OrderItem> items) {
    return items.fold(
      0.0,
      (total, item) => total + (item.quantity * item.sellingPrice),
    );
  }
}

// // Models
// class OrderModel {
//   final int tableId;
//   final List<OrderItem> items;

//   OrderModel({required this.tableId, required this.items});
// }

// class OrderItem {
//   final String name;
//   final int quantity;
//   final double sellingPrice;
//   final String type;

//   OrderItem({
//     required this.name,
//     required this.quantity,
//     required this.sellingPrice,
//     required this.type,
//   });
// }
