import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/src/models/user.dart';
import 'package:states/src/services/user_service.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: false);
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
                userService.user =
                    User(name: 'bigboss', age: 45, professions: ['developer']);
              },
              child:
                  const Text('Set user', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.setAge(50);
              },
              child:
                  const Text('Set age', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.setProfession();
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
