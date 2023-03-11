import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/data/data_user_account_local.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:tinder/src/features/likes/presentation/explore_people_screen.dart';
import 'package:tinder/src/features/likes/presentation/people_loved_screen.dart';
import 'package:tinder/src/features/likes/presentation/people_profile_screen.dart';
import 'package:tinder/src/themes/app_style.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegister = false;

  @override
  void initState() {
    super.initState();
    isUserRegister();
  }

  Future<void> isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegister();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme.themeData,
      home: isRegister ? const ExplorePeopleScreen() : const SignUpScreen(),
      // initialRoute: SingUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        SignUpUploadPhotoScreen.routeName: (context) =>
            const SignUpUploadPhotoScreen(),
        ExplorePeopleScreen.routeName: (context) => const ExplorePeopleScreen(),
        PeopleLovedScreen.routeName: (context) => const PeopleLovedScreen(),
        PeopleProfileScreen.routeName: (context) => const PeopleProfileScreen(),
      },
    );
  }
}
