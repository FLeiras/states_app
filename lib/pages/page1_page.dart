import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:states_app/models/user.dart';
import 'package:states_app/controllers/user_controller.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina - 1'),
      ),
      body: Obx(
        () => userCtrl.currentUser.value
            ? UserInfo(
                user: userCtrl.user.value,
              )
            : const NoUser(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('page2', arguments: {
          'name': 'Federico',
          'age': 40,
        }),
        child: const Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}

class NoUser extends StatelessWidget {
  const NoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay información del usuario'),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${user.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...user.profesion.map(
            (p) => ListTile(
              title: Text(p),
            ),
          ),
        ],
      ),
    );
  }
}
