// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://back-mercadolibre.onrender.com/api/users'));
  if (response.statusCode == 200) {
    print(response);
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load jewelry users');
  }
}

class Users {
  final name;
  final email;
  const Users({required this.name, required this.email});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(name: json['name'], email: json['email']);
  }
}
