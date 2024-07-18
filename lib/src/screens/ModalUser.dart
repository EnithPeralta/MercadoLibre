// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controller/ConsultaUsers.dart';

ModalEventos(BuildContext context) {
  fetchUsers().then((consultarUsers) {
    consultarUsers = consultarUsers;
  showBottomSheet(
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
              backgroundColor: Colors.amber[200],
              title: const Text("Usuarios"),
            ),
            body: ListView.builder(
              itemCount: consultarUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(consultarUsers[index].name),
                  subtitle: Text(consultarUsers[index].email),
                  trailing: const Icon(Icons.delete_rounded),
                );
              },
            ));
      }
  );
      });
}
