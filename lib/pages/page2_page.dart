import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina - 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = User(
                  name: 'Federico',
                  age: 40,
                  profesion: ['FullStack Developer', 'Gamer'],
                );

                userBloc.add(ActivateUser(newUser));
              },
              color: Colors.blue,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(ChangeUserAge(35));
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(AddProfession('Nueva profesión'));
              },
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
