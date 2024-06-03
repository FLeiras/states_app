import 'package:flutter/material.dart';

import '/models/user.dart';

class UserService with ChangeNotifier {
  late User _user;

  User get user => _user;
  // ignore: unnecessary_null_comparison
  bool get currentUser => (_user != null) ? true : false;
}
