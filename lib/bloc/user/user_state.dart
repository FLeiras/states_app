part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool currentUser;
  final User? user;

  const UserState({
    this.currentUser = false,
    required this.user,
  });
}

class InitialState extends UserState {
  const InitialState() : super(currentUser: false, user: null);
}

class AddUserState extends UserState {
  final User newUser;

  const AddUserState(
    this.newUser,
  ) : super(currentUser: true, user: newUser);
}
