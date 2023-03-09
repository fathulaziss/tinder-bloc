import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:tinder/src/features/likes/presentation/explore_people_screen.dart';
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
        SingUpAgeJobScreen.routeName: (context) => const SingUpAgeJobScreen(),
        SignUpUploadPhotoScreen.routeName: (context) =>
            const SignUpUploadPhotoScreen(),
        ExplorePeopleScreen.routeName: (context) => const ExplorePeopleScreen(),
      },
    );
  }
}
