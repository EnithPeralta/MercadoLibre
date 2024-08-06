// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String codigo;
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria;
  final String imagen;

  Product({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    required this.imagen,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      codigo: json['codigo'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
      categoria: json['categoria']['_id'],  
      imagen: json['imagen']['_id'], 
    );
  }
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://backend-mercadolibre.onrender.com/api/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
