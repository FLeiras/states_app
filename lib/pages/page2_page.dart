import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.name)
                : const Text('Page - 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final User newUser = User(
                  name: 'Federico',
                  age: 40,
                  prefesion: [
                    'Desarrollador',
                    'Gamer',
                  ],
                );

                userService.getUser(newUser);
              },
              color: Colors.blue,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userService.newAge(39);
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'Añadir profesion',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
