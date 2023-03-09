import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/widgets/logo_widget.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  const ExplorePeopleAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppAsset.image('user_image.png')),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const LogoWidget(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAsset.image('icon_notification.png')),
            ),
          ),
        )
      ],
    );
  }
}
