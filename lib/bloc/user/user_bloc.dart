import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const InitialState()) {
    on<ActivateUser>((event, emit) => emit(AddUserState(event.newUser)));

    on<ResetState>((event, emit) => emit(const InitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.currentUser) return;

      emit(AddUserState(state.user!.copyWith(age: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.currentUser) return;
      final professions = [...state.user!.profesion, event.profesion];

      emit(
        AddUserState(
          state.user!.copyWith(
            profesion: professions,
          ),
        ),
      );
    });
  }
}
