import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/src/models/user.dart';

part 'user_state.dart';

class CubitUser extends Cubit<StateUser> {
  CubitUser() : super(InitUser());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  void setAge(int age) {
    final currentState = state;

    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: age);

      emit(ActiveUser(newUser));
    }
  }

  void setProfession(String professionNew) {
    final currentState = state;

    if (currentState is ActiveUser) {
      final List<String> professionsUpdated = [
        ...currentState.user.professions,
      ];

      professionsUpdated.add(professionNew);

      final newUser =
          currentState.user.copyWith(professions: professionsUpdated);

      emit(ActiveUser(newUser));
    }
  }
}
