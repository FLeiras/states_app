part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class InitialUser extends UserState {
  final currentUser = false;

  //* Sobrescribo como se ve en consola
  // @override
  // String toString() {
  //   return 'InitialUser: false';
  // }
}

class ActiveUser extends UserState {
  final currentUser = true;
  final User user;

  ActiveUser(this.user);
}
