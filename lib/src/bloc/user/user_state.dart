part of 'user_cubit.dart';

@immutable
abstract class StateUser {}

class InitUser extends StateUser {
  final isUserExist = false;
}

class ActiveUser extends StateUser {
  final isUserExist = true;
  final User user;

  ActiveUser(this.user);
}
