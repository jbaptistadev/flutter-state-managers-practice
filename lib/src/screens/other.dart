import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/src/bloc/user/user_cubit.dart';
import 'package:states/src/models/user.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitUser = context.read<CubitUser>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('other'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                cubitUser.selectUser(
                    User(name: 'bigboss', age: 45, professions: ['developer']));
              },
              child:
                  const Text('Set user', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                cubitUser.setAge(50);
              },
              child:
                  const Text('Set age', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                cubitUser.setProfession('developer ${Random().nextInt(10)}');
              },
              child: const Text('Set profession',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
