import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/src/models/user.dart';
import 'package:states/src/services/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: userService.userExist
          ? _ProfileUser(userService.user!)
          : const Center(
              child: Text(
              'dont user exist',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'other'),
          child: const Icon(Icons.arrow_circle_right)),
    );
  }
}

class _ProfileUser extends StatelessWidget {
  const _ProfileUser(this.user);

  final User user;

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
          ...user.professions
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList()
        ],
      ),
    );
  }
}
