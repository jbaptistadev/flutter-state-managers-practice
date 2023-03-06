import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/src/bloc/user/user_cubit.dart';
import 'package:states/src/screens/home.dart';
import 'package:states/src/screens/other.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CubitUser())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'States App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'other': (context) => const OtherScreen(),
        },
      ),
    );
  }
}
