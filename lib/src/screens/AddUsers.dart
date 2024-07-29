// ignore_for_file: file_names, unused_field

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controller/ConsultaUsers.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<Users>? _futureUsers;
  
  void _clearControllers() {
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
              key: _formKey,
              child: Column(
                children: [
                  Image.network(
                    'https://static-00.iconduck.com/assets.00/login-icon-512x512-yc5lyacx.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Go to Sign Up",
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Create new account",
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                        labelText: "Full name",
                        prefixIcon: const Icon(Icons.person_3_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter full name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email address";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_open_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password Confirmation",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password confirmation";
                      }
                      else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              _futureUsers = addUsers(
                                _nombreController.text,
                                _emailController.text,
                                _passwordController.text,
                              );
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Successful registration')));
                          _clearControllers();
                          _navigateToLogin();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 160, 0, 1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: const Text("Sign up"),
                      )),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/inicio');
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 160, 0, 1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
