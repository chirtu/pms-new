import 'package:flutter/material.dart';

import '../Lists/drinks_lists.dart';

class DrinksPage extends StatelessWidget {
  const DrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/restaurant.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.5  ),
          body: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Center(
                  child: Text('Drinks',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: dummyDrinksList.length,
                      itemBuilder: (context, index) {
                        final drink = dummyDrinksList[index];
                        return SizedBox(
                          height: 120,
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Image.asset(
                                      drink.imageUrl,
                                      fit: BoxFit.cover,
                                      width: 100, 
                                      height:
                                          100, 
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      drink.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Unit: ${drink.unit}',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Qty: ${drink.stockQuantity}',
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Center(
                                        child: Text(
                                            'Selling  ${drink.sellingPrice.toString()}'),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                            'Selling n ${drink.sellingPrice.toString()}'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 70,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.all(16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Total sold/day \n 1000/=',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Total sold/day \n 1000/=',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        ]
      ),
    );
  }
}
