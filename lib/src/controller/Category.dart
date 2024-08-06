// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class Category {
  final String id;
  final String codigo;
  final String nombre;

  Category({required this.id, required this.codigo, required this.nombre});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      codigo: json['codigo']?? 'N/A',
      nombre: json['nombre']?? 'N/A',
    );
  }
}

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse('https://backend-mercadolibre.onrender.com/api/category'));
  if (response.statusCode == 201) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Category.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
