// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.network(
                    "https://static-00.iconduck.com/assets.00/login-icon-512x512-yc5lyacx.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Welcome to Mercado Libre',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16.0),
                  const Text('Sign in to continue',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Enter your email address",
                        prefixIcon: const Icon(Icons.email_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(                      
                        labelText: "Enter your password",
                        prefixIcon: const Icon(Icons.lock_open_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/principal');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.orangeAccent[700],
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Sign In'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'OR',
                    style: TextStyle(color: Colors.orange),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.network(
                        'https://cdn-icons-png.freepik.com/256/2504/2504739.png?semt=ais_hybrid',
                        height: 41,
                        width: 41,
                      ),
                      label: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 127, 7)),
                          'Google'),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs-9BYjA24g8-jhWfxvncwJ26rh764wu2Fqw&s',
                        height: 41,
                        width: 41,
                      ),
                      label: const Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 127, 7)),
                          'Facebook'),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot your password',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 127, 7)),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      child: const Text(
                        'No account? Register',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 127, 7)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
