import 'package:flutter/material.dart';
import 'package:states/src/models/user.dart';
import 'package:states/src/services/user_service.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data.name)
                : const Text('other');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userService.loadUser(
                  User(name: 'bigboss', age: 40, professions: ['developer'])),
              child:
                  const Text('Set user', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.loadAge(50);
              },
              child:
                  const Text('Set age', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text('Set profession',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
