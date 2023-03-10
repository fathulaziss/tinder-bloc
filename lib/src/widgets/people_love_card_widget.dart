import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/presentation/people_profile_screen.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class PeopleLoveCardWidget extends StatelessWidget {
  const PeopleLoveCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PeopleProfileScreen.routeName);
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
                image: AssetImage(AppAsset.image('people_love3_image.png')),
              ),
            ),
          ),
          title: Text(
            'Ismirada',
            style: AppTextStyle.white(
              fontSize: AppFontSize.f20,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          subtitle: Text('22, Doctor ', style: AppTextStyle.grey60()),
        ),
      ),
    );
  }
}
