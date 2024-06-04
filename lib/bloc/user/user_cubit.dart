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
}
