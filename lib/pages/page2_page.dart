import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:states_app/models/user.dart';
import 'package:states_app/controllers/user_controller.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (userCtrl.user.value.name == null)
            ? const Text('Page - 2')
            : Text(userCtrl.user.value.name!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userCtrl.addUser(
                  User(
                    name: 'Federico',
                    age: 40,
                    profesion: ['FullStack Dev', 'Gamer'],
                  ),
                );
                Get.snackbar('Usuario cargado',
                    '${userCtrl.user.value.name}, establecido',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]);
              },
              color: Colors.blue,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userCtrl.changeAge(35);
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userCtrl.addProfession(
                    'Profecion #${userCtrl.professionCount + 1}');
              },
              color: Colors.blue,
              child: const Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar tema',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
