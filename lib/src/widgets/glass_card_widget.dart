import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/domain/user.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 26, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        image: DecorationImage(
          image: AssetImage(AppAsset.image('glass_card_image.png')),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.fullname,
                style: AppTextStyle.white(
                  fontSize: AppFontSize.f20,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              Text(
                '${user.age}, ${user.occupation}',
                style: AppTextStyle.white(fontSize: AppFontSize.f14),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.image('icon_profile.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
