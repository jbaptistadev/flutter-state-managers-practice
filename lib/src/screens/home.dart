import 'package:flutter/material.dart';
import 'package:states/src/services/user_service.dart';

import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? _ProfileUser(snapshot.data!)
              : const Center(
                  child: Text(
                  'dont user exist',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'other'),
          child: const Icon(Icons.arrow_circle_right)),
    );
  }
}

class _ProfileUser extends StatelessWidget {
  final User user;

  const _ProfileUser(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          const Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age}'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Profession',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          ),
          const Divider(),
          const ListTile(
            title: Text('profession 1'),
          ),
          const ListTile(
            title: Text('profession 2'),
          ),
          const ListTile(
            title: Text('profession 3'),
          ),
        ],
      ),
    );
  }
}
