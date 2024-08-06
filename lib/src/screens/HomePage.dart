// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/interface/Categories.dart';
import 'package:mercadolibre/src/controller/Category.dart';
import 'package:mercadolibre/src/screens/Products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Mercado Libre'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/inicio');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.amber[700],
                ),
                child: const Icon(Icons.login_outlined),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.amber[700],
                ),
                child: const Icon(Icons.app_registration_rounded),
              ),
            ],
          ),
        ),
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
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_rounded),
                  color: Colors.amber[700],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/administrador');
                  },
                  icon: const Icon(Icons.admin_panel_settings_outlined),
                  color: Colors.amber[700],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Category>>(
                future: futureCategories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final categories = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  Icon(iconos[index]['icono'], color: Colors.amber[700]),
                                  const SizedBox(height: 10),
                                  Text(
                                    categories[index].nombre,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No categories found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.0, color: Colors.amber[700]),
          label: 'Start',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_2, size: 30.0, color: Colors.amber[700]),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app_rounded, size: 30.0, color: Colors.amber[700]),
          label: 'Exit',
        ),
      ]),
    );
  }
}