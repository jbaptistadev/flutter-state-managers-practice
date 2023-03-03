import 'dart:async';

import 'package:states/src/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  User? get user => _user;
  bool get userExist => _user != null;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void loadAge(int age) {
    _user!.age = age;
    _userStreamController.add(_user!);
  }
}

final userService = _UserService();
