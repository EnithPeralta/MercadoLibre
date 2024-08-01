// ignore_for_file: file_names, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controller/ConsultaUsers.dart';

void modalUsuarios(BuildContext context) {
  fetchUsers().then((userList) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              appBar: AppBar(
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.event_outlined),
                  )
                ],
                backgroundColor: Colors.amber[700],
                title: const Text("Users"),
              ),
              body: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(userList[index].nombre),
                    subtitle: Text(userList[index].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _showUpdateUser(context, userList[index], () {
                              setState(() {
                                fetchUsers().then((newUserList) {
                                  setState(() {
                                    userList = newUserList;
                                  });
                                }).catchError((error) {
                                  print('Error fetching users: $error');
                                });
                              });
                            });
                          },
                          icon: const Icon(Icons.update_rounded),
                          color: const Color.fromARGB(255, 255, 139, 7),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_rounded,
                              color: Colors.red),
                          onPressed: () {
                            _showDeleteUser(context, userList[index].id, () {
                              deleteUsers(userList[index].id).then((value) {
                                setState(() {
                                  userList.removeAt(index);
                                });
                              }).catchError((error) {
                                print("Error al eliminar usuario: $error");
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  });
}

void _showDeleteUser(
    BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm delete'),
        content: const Text('Are you sure you want to delete the user?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDeleteConfirmed();
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}

void _showUpdateUser(
    BuildContext context, Users user, VoidCallback onUpdateUser) {
  TextEditingController nombreController =
      TextEditingController(text: user.nombre);
  TextEditingController emailController =
      TextEditingController(text: user.email);
  TextEditingController passwordController =
      TextEditingController(text: user.password);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String nombre = nombreController.text;
              String email = emailController.text;
              String password = passwordController.text;
              if (nombre.isNotEmpty &&
                  email.isNotEmpty &&
                  password.isNotEmpty) {
                updateUsers(user.id, nombre, email, password)
                    .then((updatedUser) {
                  Navigator.of(context).pop();
                  onUpdateUser();
                }).catchError((error) {
                  print('Error al actualizar un usuario: $error');
                  Navigator.of(context).pop();
                });
              } else {
                print('Error: los campos no pueden estar vacíos');
              }
            },
            child: const Text('Update'),
          )
        ],
      );
    },
  );
}
