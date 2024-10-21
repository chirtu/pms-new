import 'package:flutter/material.dart';
import 'package:pms_app/models/drinks.dart';
import 'package:pms_app/models/foods.dart';
import 'package:pms_app/models/order.dart';
import 'package:pms_app/widget/grid_view.dart';
import 'Order_preview_page.dart';
import '../widget/custom_text_field.dart';
import '../widget/drinks_item.dart';
import '../widget/food_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  void resetSelections() {
    for (var food in dummyFoodList) {
      food.isSelected = false;
      food.boughtQuantity = 0;
    }

    for (var drink in dummyDrinksList) {
      drink.isSelected = false;
      drink.boughtQuantity = 0;
    }
  }

  void _showOrderConfirmationDialog(BuildContext context) {
    List<Order> selectedItems = [];

    showDialog(
      context: context,
      builder: (context) {
        int? selectedTableNumber;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              title: Text('Select Table Number'),
              content: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0, // gap between lines
                  children: List<Widget>.generate(20, (int index) {
                    return ChoiceChip(
                      label: Text((index + 1).toString()),
                      selected: selectedTableNumber == index + 1,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary, // Color when not selected
                      selectedColor: Theme.of(context)
                          .colorScheme
                          .primary, // Color when selected
                      onSelected: (bool selected) {
                        setState(() {
                          selectedTableNumber = selected ? index + 1 : null;
                        });
                      },
                    );
                  }),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: selectedTableNumber != null
                      ? () {
                          // Add selected foods
                          // for (var food in dummyFoodList) {
                          //   if (food.isSelected && food.boughtQuantity > 0) {
                          //     Order order = Order(
                          //       foods: [food],
                          //     );
                          //     selectedItems.add(order);
                          //   }
                          // }

                          // Add selected drinks
                          for (Drink drink in dummyDrinksList) {
                            if (drink.isSelected && drink.boughtQuantity > 0) {
                              Order order = Order(
                                drinks: [drink],
                              );
                              selectedItems.add(order);
                            }
                            print(selectedItems);
                          }

                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPreviewPage(
                                selectedItems: selectedItems,
                                tableNumber: selectedTableNumber,
                                resetSelectionsCallback: resetSelections,
                              ),
                            ),
                          );
                        }
                      : null,
                ),
              ],
            );
          },
        );
      },
    );
  }
  // This will track which item is selected
  int selectedIndex = 0; // Start with Foods tab selected

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        Image.asset(
          'assets/images/restaurant.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.surface.withOpacity(0.5),
          body: Column(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                        Text(
                          'PMS',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.playlist_add_check),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          icon: const Icon(Icons.person),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    CustomTextField(
                      controller: searchController,
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      fontSize: 15,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      borderRadius: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(0, 'Foods'),
                  _buildTabItem(1, 'Drinks'),
                  _buildTabItem(2, 'Fruits'),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: IndexedStack(
                  index:
                      selectedIndex, // Use IndexedStack to show selected item
                  children: const [
                    GridDisplay(
                        type:
                            'food'), // Pass type to distinguish food and drinks
                    GridDisplay(
                        type:
                            'drink'), // You need to implement this in GridDisplay
                    Center(
                        child:
                            Text('Fruits Grid Here')), // Placeholder for Fruits
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/foods');
                          },
                          icon: const Icon(
                            Icons.restaurant_menu,
                            size: 34,
                          ),
                          color: Colors.white,
                        ),
                        const Text(
                          'Foods',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            _showOrderConfirmationDialog(context);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 34,
                          ),
                          color: Colors.white,
                        ),
                        const Text('New Order',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/drinks');
                          },
                          icon: const Icon(
                            Icons.local_bar_sharp,
                            size: 34,
                          ),
                          color: Colors.white,
                        ),
                        const Text('Drinks',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index
        });
      },
      child: Container(
        height: 50,
        width: 100,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
