import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/match_button_widget.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  const ProfileDetailImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppAsset.image('people_love1_image.png')),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                dimension: 20,
                iconPath: 'icon_arrow_left.png',
                onTap: () {},
              ),
              Text(
                'Lover Profile\nDetail',
                style: AppTextStyle.white(
                  fontWeight: AppFontWeight.semiBold,
                  fontSize: AppFontSize.f20,
                ),
                textAlign: TextAlign.center,
              ),
              MatchButtonWidget(
                dimension: 20,
                iconPath: 'icon_close_circle.png',
                onTap: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
