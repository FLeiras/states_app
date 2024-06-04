import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_cubit.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina - 1'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is InitialUser) {
            return const Center(child: Text('No hay información del usuario'));
          } else {
            return const UserInfo();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: const Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: '),
          ),
          ListTile(
            title: Text('Edad: '),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Profesion 1'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
          ListTile(
            title: Text('Profesion 3'),
          ),
        ],
      ),
    );
  }
}
