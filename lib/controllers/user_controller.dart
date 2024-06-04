import 'package:get/get.dart';

import 'package:states_app/models/user.dart';

class UserController extends GetxController {
  var currentUser = false.obs;
  var user = User().obs;

  int get professionCount {
    return user.value.profesion.length;
  }

  void addUser(User user) {
    currentUser.value = true;
    this.user.value = user;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    user.update((val) {
      val!.profesion = [...val.profesion, profession];
    });
  }
}
