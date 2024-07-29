// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//Metodo Get
Future<List<Users>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://backend-mercadolibre.onrender.com/api/users'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

//Metodo Add

Future<Users> addUsers(String nombre, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://backend-mercadolibre.onrender.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "nombre": nombre,
      "email": email,
      "password": password
    }),
  );

  if (response.statusCode == 201) {
    return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('No es posible registrarse');
  }
}

class Users {
  final String nombre;
  final String email;
  final String password;

  const Users({
    required this.nombre,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      nombre: json['nombre'],
      email: json['email'],
      password: json['password'],
    );
  }
}
