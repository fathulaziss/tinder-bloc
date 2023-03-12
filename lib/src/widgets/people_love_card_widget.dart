import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/domain/user.dart';
import 'package:tinder/src/features/likes/presentation/people_profile_screen.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class PeopleLoveCardWidget extends StatelessWidget {
  const PeopleLoveCardWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PeopleProfileScreen.routeName,
          arguments: user,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 18),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAsset.image(user.imagePath)),
              ),
            ),
          ),
          title: Text(
            user.fullname,
            style: AppTextStyle.white(
              fontSize: AppFontSize.f20,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          subtitle: Text(
            '${user.age}, ${user.occupation} ',
            style: AppTextStyle.grey60(),
          ),
        ),
      ),
    );
  }
}
