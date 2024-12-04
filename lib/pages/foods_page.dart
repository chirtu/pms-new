import 'package:flutter/material.dart';

import '../Lists/foods_list.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Foods'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            Wrap(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  icon: Icon(Icons.add))
            ])
          ],
        ),
        body: Column(
          children: [
            // Container(
            //   height: 100,
            //   decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(20),
            //       bottomRight: Radius.circular(20),
            //     ),
            //     color: Theme.of(context).colorScheme.primary,
            //   ),
            //   child: Center(
            //     child: Text(
            //       'Foods',
            //       style: TextStyle(
            //         fontSize: 32,
            //         fontFamily: 'Poppins',
            //         fontWeight: FontWeight.bold,
            //         color: Theme.of(context).colorScheme.surface,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: dummyFoodList.length,
                    itemBuilder: (context, index) {
                      final food = dummyFoodList[index];
                      return Container(
                        margin: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10),
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
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Image.asset(
                                  food.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  food.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Price ${food.sellingPrice.toDouble()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description: ${food.description}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Served With: ${food.servedWith}',
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
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
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Total sold/day \n 1000/=',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Total sold/day \n 1000/=',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
