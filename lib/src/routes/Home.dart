// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/screens/HomePage.dart';
import 'package:mercadolibre/src/screens/Login.dart';
import 'package:mercadolibre/src/screens/Register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/inicio': (context) => const Login(),
        '/registro': (context) => const Registrarse()
      },
    );
  }
}
