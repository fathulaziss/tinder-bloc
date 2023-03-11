import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/data/data_user_account_local.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:tinder/src/features/likes/presentation/people_loved_screen.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/widgets/logo_widget.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  const ExplorePeopleAppBarWidget({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            UserAccountRegister.userAccountLogout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              SignUpScreen.routeName,
              (route) => false,
            );
          },
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imagePath != null
                    ? FileImage(File(imagePath!))
                    : AssetImage(AppAsset.image('user_image.png'))
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const LogoWidget(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PeopleLovedScreen.routeName);
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.image('icon_notification.png')),
              ),
            ),
          ),
        )
      ],
    );
  }
}
