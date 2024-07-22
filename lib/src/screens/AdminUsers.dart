// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/screens/ModalUser.dart';

class MenUsers extends StatefulWidget {
  const MenUsers({super.key});

  @override
  State<MenUsers> createState() => _MenUsersState();
}

class _MenUsersState extends State<MenUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
        title: const Text(
          "Administrador Usuario",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
              "https://cdn-icons-png.flaticon.com/512/1535/1535024.png",
              width: 300,
              height: 300),
          const SizedBox(height: 16.0),
          Card(
            child: ListTile(
              title: const Text("Buscar Usuario"),
              leading: const Icon(Icons.search_rounded),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          ),
          Card(
              child: ListTile(
                  title: const Text("Usuarios"),
                  leading: const Icon(Icons.connect_without_contact_rounded),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {
                    modalUsuarios(context);
                  })),
          Card(
              child: ListTile(
                  title: const Text("Solicitudes"),
                  leading: const Icon(Icons.connect_without_contact_rounded),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {})),
          Card(
              child: ListTile(
                  title: const Text("Informes"),
                  leading: const Icon(Icons.info_outlined),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {})),
        ],
      ),
    );
  }
}
