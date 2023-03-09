import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/widgets/glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: AppColor.secondary),
            borderRadius: BorderRadius.circular(70),
            image: DecorationImage(
              image: AssetImage(AppAsset.image('people_love2_image.png')),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const GlassCardWidget(),
      ],
    );
  }
}
