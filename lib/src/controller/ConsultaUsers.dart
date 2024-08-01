// ignore_for_file: file_names, avoid_print

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

Future<void> createUsers(String nombre, String email, String password) async {
  final url = Uri.parse('https://backend-mercadolibre.onrender.com/api/users');

  final headers = {
    'Content-Type': 'application/json',
  };

  final body =
      jsonEncode({'nombre': nombre, 'email': email, 'password': password});

  try {
    print('Enviando solicitud para crear usuario');
    final response = await http.post(url, headers: headers, body: body);
    print('Respuesta recibida: ${response.statusCode}');

    if (response.statusCode == 201) {
      print('Usuario creado correctamente');
    } else {
      print('Error al crear usuario: ${response.body}');
      throw Exception('No se pudo crear el usuario');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class Users {
  final String _id;
  final String nombre;
  final String email;

  const Users({
    required String id,
    required this.nombre,
    required this.email,
  }) : _id = id;

  Users.empty()
      : _id = '',
        nombre = '',
        email = '';

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id'],
      nombre: json['nombre'],
      email: json['email'],
    );
  }
  //Metodo Get Id
  String get id => _id;

  get password => '';
}

//Metodo Delete
Future<Users> deleteUsers(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://backend-mercadolibre.onrender.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return Users.empty();
  } else if (response.statusCode == 404) {
    throw Exception('User not found.');
  } else {
    throw Exception('Failed to delete user.');
  }
}

//Metodo Uptade
Future<Users> updateUsers(
    String id, String nombre, String email, String password) async {
  final http.Response response = await http.put(
    Uri.parse('https://backend-mercadolibre.onrender.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': nombre,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return Users.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 404) {
    throw Exception('User not found.');
  } else {
    throw Exception('Failed to update user.');
  }
}
