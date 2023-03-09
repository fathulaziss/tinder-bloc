import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215,
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(AppAsset.image('hero_image.png')),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
