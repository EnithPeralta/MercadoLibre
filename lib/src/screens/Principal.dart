// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/interface/Categories.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[700],
          foregroundColor: Colors.white,
          title: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mercado Libre'),
                ],
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Product search',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_rounded),
                      color: Colors.amber[700],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_sharp),
                      color: Colors.amber[700],
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 2.0,
                          margin: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(categories[index]['icono'],
                                      color: Colors.amber[700]),
                                  const SizedBox(width: 10),
                                  Text(
                                    categories[index]['titulo'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0, color: Colors.amber[700]),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_2, size: 30.0, color: Colors.amber[700]),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.person_pin, size: 30.0, color: Colors.amber[700]),
              label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app_rounded,
                size: 30.0, color: Colors.amber[700]),
            label: 'Exit',
          )
        ]));
  }
}
