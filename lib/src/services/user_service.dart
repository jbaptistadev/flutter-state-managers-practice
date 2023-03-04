import 'package:flutter/material.dart';
import 'package:states/src/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  bool get userExist => _user != null;

  void setAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void setProfession() {
    _user!.professions.add('Profession ${_user!.professions.length + 1}');
    notifyListeners();
  }
}
