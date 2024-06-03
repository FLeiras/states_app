// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:states_app/models/user.dart';

class _UserService {
  late User _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? get user => _user;
  bool get currentUser => (_user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  void getUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void newAge(int age) {
    _user.age = age;
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
