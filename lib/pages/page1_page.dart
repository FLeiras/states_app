import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../bloc/user/user_bloc.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina - 1'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(ResetState());
            },
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.currentUser
              ? UserInfo(user: state.user)
              : const Center(
                  child: Text('No hay información del usuario'),
                );
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
  final User? user;

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
            title: Text('Nombre: ${user!.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user!.age}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...user!.profesion.map((p) => ListTile(title: Text(p)))
        ],
      ),
    );
  }
}
