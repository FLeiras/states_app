// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUser());

  void userSelect(User user) {
    emit(ActiveUser(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit(ActiveUser(newUser));
    }
  }

  void addProfesion() {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newProfesion = [
        ...currentState.user.profesion,
        'Profesion ${currentState.user.profesion.length + 1}',
      ];
      final newUser = currentState.user.copyWith(profesion: newProfesion);
      emit(ActiveUser(newUser));
    }
  }

  void logout() {
    emit(InitialUser());
  }
}
