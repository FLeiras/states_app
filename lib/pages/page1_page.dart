import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';
import 'package:states_app/bloc/user/user_cubit.dart';

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
            onPressed: () => context.read<UserCubit>().logout(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: const Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case const (InitialUser):
            return const Center(child: Text('No hay información del usuario'));
          case const (ActiveUser):
            return UserInfo(user: (state as ActiveUser).user);
          default:
            return const Center(child: CircularProgressIndicator());
        }

        //? Otra opcion al switch case statement
        // if (state is InitialUser) {
        //   return const Center(child: Text('No hay información del usuario'));
        // } else if (state is ActiveUser) {
        //   return UserInfo(user: state.user);
        // } else {
        //   return const CircularProgressIndicator();
        // }
      },
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
          )
        ],
      ),
    );
  }
}
