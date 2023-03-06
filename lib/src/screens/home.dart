import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/src/bloc/user/user_cubit.dart';
import 'package:states/src/models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'other'),
          child: const Icon(Icons.arrow_circle_right)),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitUser, StateUser>(
      builder: (_, state) {
        // if (state is InitUser) {
        //   return const Center(
        //     child: Text(
        //       'User dont exist',
        //       style: TextStyle(
        //           fontSize: 30,
        //           color: Colors.black54,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   );
        // } else if (state is ActiveUser) {
        //   return _ProfileUser(state.user);
        // } else {
        //   return const Text('What');
        // }

        switch (state.runtimeType) {
          case InitUser:
            return const Center(
              child: Text(
                'User dont exist',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            );

          case ActiveUser:
            return _ProfileUser((state as ActiveUser).user);
          default:
            return const Text('What');
        }
      },
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
          ...user.professions.map(
            (profession) => ListTile(
              title: Text(profession),
            ),
          )
        ],
      ),
    );
  }
}
