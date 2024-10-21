import 'package:flutter/material.dart';
import '../models/order.dart';

class OrdersPage extends StatelessWidget {
  final List<Order> orders;

  OrdersPage({required this.orders});

  @override
  Widget build(BuildContext context) {
    // Group orders by tableId
    final groupedOrders = <String, List<Order>>{};
    for (var order in orders) {
      if (order.tableId != null) {
        groupedOrders.putIfAbsent(order.tableId!, () => []).add(order);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: groupedOrders.keys.length,
        itemBuilder: (context, index) {
          final tableId = groupedOrders.keys.elementAt(index);
          final ordersForTable = groupedOrders[tableId]!;
          
          // Calculate total cost for the orders at this table
          // final totalCost = ordersForTable.map((o) => o.sellingPrice * o.quantity).reduce((a, b) => a + b);
          
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              title: Text('Table ID: $tableId', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Items:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ...ordersForTable.map((order) => ListTile(
                            title: Text(order.tableId!),
                            // subtitle: Text('Quantity: ${order.totalCost}, Type: ${order.type}'),
                            // trailing: Text('\$${order.totalCost   * order.quantity}'),
                          )),
                      Divider(),
                      // Text(
                      //   'Total Cost: \$${o}',
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.green,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
