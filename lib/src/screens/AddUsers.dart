// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controller/ConsultaUsers.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<Usuarios>? _futureUsuarios;

  void _cleaController() {
    _nombreController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, '/inicio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
                child: Column(
              children: [
                Image.network(
                  'https://static-00.iconduck.com/assets.00/login-icon-512x512-yc5lyacx.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Ir a Registrarse",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Crear una nueva cuenta",
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _cedulaController,
                  decoration: InputDecoration(
                      labelText: "Cedula",
                      prefixIcon: const Icon(Icons.document_scanner_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese su documento";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                      labelText: "Nombre completo",
                      prefixIcon: const Icon(Icons.person_3_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese nombre completo";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _futureUsuarios = addUsers(
                              _nombreController.text,
                              _emailController.text,
                              _passwordController.text,
                            );
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registro exitoso')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Text("Registrarse"),
                    )),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Tienes una cuenta?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/inicio');
                      },
                      child: const Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
