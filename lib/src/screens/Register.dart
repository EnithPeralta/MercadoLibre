// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final _formKey = GlobalKey<FormState>();
  String nombres = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Image.network(
                          "https://static-00.iconduck.com/assets.00/login-icon-512x512-yc5lyacx.png",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Ir a registrarse",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Crear una nueva cuenta",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Nombre completo",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su nombre completo";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            nombres = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Correo",
                              prefixIcon: const Icon(Icons.email_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Contraseña",
                              prefixIcon: const Icon(Icons.lock_open_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirmar contraseña",
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Registro Exitoso')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.orangeAccent[700],
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Inscribirse'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/inicio');
                            },
                            child: const Text(
                              'Tiene una cuenta? Iniciar Sesion',
                              style: TextStyle(color: Colors.indigo),
                            ))
                      ]))))),
    ));
  }
}
