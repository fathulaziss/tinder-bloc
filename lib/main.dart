import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/src/app.dart';
import 'package:tinder/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:tinder/src/features/likes/presentation/bloc/bloc/explore_people_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ExplorePeopleBloc())
      ],
      child: const AppScreen(),
    );
  }
}
