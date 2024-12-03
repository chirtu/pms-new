import 'package:flutter/material.dart';

import '../Lists/order_list.dart';

class OrderPreviewPage extends StatefulWidget {
  OrderPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderPreviewPage> createState() => _OrderPreviewPageState();
}

class _OrderPreviewPageState extends State<OrderPreviewPage> {

  @override
  Widget build(BuildContext context) {
    final orderModel = dummyOrders.first;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Table ${orderModel.tableId}'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Foods
                  if (orderModel.items.any((item) => item.type == "Food")) ...[
                    Container(
                      height: 50,
                      color: Color(0xFFFFE4C2),
                      child: Center(
                        child: Text(
                          "Foods",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderModel.items
                          .where((item) => item.type == "Food")
                          .length,
                      itemBuilder: (context, index) {
                        final item = orderModel.items
                            .where((item) => item.type == "Food")
                            .toList()[index];
                        return _buildItemTile(item, context);
                      },
                    ),
                  ],
                  const SizedBox(height: 16),
                  // Drinks
                  if (orderModel.items.any((item) => item.type == "Drink")) ...[
                    Container(
                      height: 50,
                      color: Color(0xFFFFE4C2),
                      child: Center(
                        child: Text(
                          "Drinks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderModel.items
                          .where((item) => item.type == "Drink")
                          .length,
                      itemBuilder: (context, index) {
                        final item = orderModel.items
                            .where((item) => item.type == "Drink")
                            .toList()[index];
                        return _buildItemTile(item, context);
                      },
                    ),
                  ],
                ],
              ),
            ),
            // Total Cost
            const Divider(
              color: Color(0xFFFFE4C2),
              height: 10,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Total Cost:",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                Text(
                  "Tsh ${_calculateTotalCost(orderModel.items).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  "Confirm Order",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTile(OrderItem item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).primaryColor.withOpacity(0.4), // Shadow color
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
                ),
                Text(
                  "Tsh ${(item.quantity * item.sellingPrice).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 10.0),
                ),
              ],
            ),
            Text(
              "Quantity: ${item.quantity}",
              style: TextStyle(fontSize: 10.0),
            ),
            // Text(
            //   "Tsh ${(item.quantity * item.sellingPrice).toStringAsFixed(2)}",
            //   style: TextStyle(fontSize: 12.0),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        item.quantity += 1;
                      });
                      // Action to perform when the button is pressed
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      Widget _buildItemTile(
                          OrderItem item, BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.4), // Shadow color
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(4),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Tsh ${(item.quantity * item.sellingPrice).toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Quantity: ${item.quantity}",
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            item.quantity += 1;
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            if (item.quantity > 0) {
                                              item.quantity -= 1;
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }

                      Text("Increment");
                    },
                    icon: Icon(Icons.remove),
                  ),
                ),
              ],
            )
          ],
        ),
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
