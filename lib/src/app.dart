import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:tinder/src/themes/app_style.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme.themeData,
      initialRoute: SingUpScreen.routeName,
      routes: {
        SingUpScreen.routeName: (context) => const SingUpScreen(),
      },
    );
  }
}
