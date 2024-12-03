class OrderModel {
  final int tableId;
  final List<OrderItem> items;

  OrderModel({required this.tableId, required this.items});
}

class OrderItem {
  final String name;
  int quantity;
  final double sellingPrice;
  final String type;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.sellingPrice,
    required this.type,
  });
}

List<OrderModel> dummyOrders = [
  OrderModel(
    tableId: 1,
    items: [
      OrderItem(
          name: "Grilled Chicken",
          quantity: 2,
          sellingPrice: 15.0,
          type: "Food"),
      OrderItem(
          name: "French Fries", quantity: 1, sellingPrice: 5.0, type: "Food"),
      OrderItem(
          name: "Coca-Cola", quantity: 3, sellingPrice: 2.0, type: "Drink"),
      OrderItem(
          name: "Caesar Salad", quantity: 1, sellingPrice: 7.0, type: "Food"),
      OrderItem(
          name: "Lemonade", quantity: 2, sellingPrice: 3.5, type: "Drink"),
    ],
  ),
  OrderModel(
    tableId: 2,
    items: [
      OrderItem(
          name: "Beef Burger", quantity: 1, sellingPrice: 10.0, type: "Food"),
      OrderItem(
          name: "Orange Juice", quantity: 2, sellingPrice: 3.0, type: "Drink"),
      OrderItem(
          name: "Pasta Alfredo", quantity: 1, sellingPrice: 12.0, type: "Food"),
      OrderItem(
          name: "Chocolate Milkshake",
          quantity: 1,
          sellingPrice: 4.5,
          type: "Drink"),
      OrderItem(
          name: "Garlic Bread", quantity: 1, sellingPrice: 3.0, type: "Food"),
    ],
  ),
  OrderModel(
    tableId: 3,
    items: [
      OrderItem(
          name: "Pepperoni Pizza",
          quantity: 2,
          sellingPrice: 18.0,
          type: "Food"),
      OrderItem(
          name: "Apple Pie", quantity: 1, sellingPrice: 6.0, type: "Food"),
      OrderItem(
          name: "Iced Tea", quantity: 2, sellingPrice: 2.5, type: "Drink"),
      OrderItem(
          name: "Vanilla Ice Cream",
          quantity: 1,
          sellingPrice: 4.0,
          type: "Food"),
    ],
  ),
  OrderModel(
    tableId: 4,
    items: [
      OrderItem(
          name: "Grilled Salmon",
          quantity: 1,
          sellingPrice: 20.0,
          type: "Food"),
      OrderItem(
          name: "Mashed Potatoes",
          quantity: 1,
          sellingPrice: 5.0,
          type: "Food"),
      OrderItem(
          name: "Red Wine", quantity: 2, sellingPrice: 12.0, type: "Drink"),
      OrderItem(
          name: "Cheesecake", quantity: 1, sellingPrice: 6.5, type: "Food"),
    ],
  ),
  OrderModel(
    tableId: 5,
    items: [
      OrderItem(
          name: "Vegetarian Pizza",
          quantity: 1,
          sellingPrice: 15.0,
          type: "Food"),
      OrderItem(
          name: "Mineral Water", quantity: 3, sellingPrice: 1.5, type: "Drink"),
      OrderItem(
          name: "Spaghetti Bolognese",
          quantity: 1,
          sellingPrice: 14.0,
          type: "Food"),
      OrderItem(
          name: "Panna Cotta", quantity: 1, sellingPrice: 5.0, type: "Food"),
    ],
  ),
];
