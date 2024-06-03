import 'package:flutter/material.dart';

import '/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;
  // ignore: unnecessary_null_comparison
  bool get currentUser => (_user != null) ? true : false;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void userRemove() {
    _user = null;
    notifyListeners();
  }

  void addProfesion() {
    _user!.profesion.add('Profesion ${_user!.profesion.length + 1}');
    notifyListeners();
  }
}
