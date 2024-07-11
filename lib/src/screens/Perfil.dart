// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.white,
            )),
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj1bsqf-7mldQqOkLYP_sNiz4DMl9STE1hug&s"),
              ),
              const SizedBox(height: 10),
              const Text("Maria Peralta",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text("@peraltamosquera",
                  style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              const SizedBox(height: 30),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.amber),
                    title: const Text("Genero"),
                    trailing: const Text("Femenino"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.cake_rounded, color: Colors.amber),
                    title: const Text("Cumpleaños"),
                    trailing: const Text("12-07-2004"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.phone_rounded, color: Colors.amber),
                    title: const Text("Numero de telefono"),
                    trailing: const Text("3227302199"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline_rounded,
                        color: Colors.amber),
                    title: const Text("Cambiar contraseña"),
                    trailing: const Icon(Icons.arrow_circle_right),
                    iconColor: Colors.amber[700],
                    onTap: () {},
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
