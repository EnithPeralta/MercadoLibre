// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controller/ConsultaUsers.dart';

modalUsuarios(BuildContext context) {
  fetchUsers().then((fetchUsers) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.event_outlined),
                )
              ],
              backgroundColor: Colors.amber[700],
              title: const Text("Usuarios"),
            ),
            body: 
            ListView.builder(
              itemCount: fetchUsers.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(fetchUsers[index].nombre),
                  subtitle: Text(fetchUsers[index].email),
                  trailing: const Icon(Icons.delete_rounded),
                );
              },
            )
          );
        });
  });
}
