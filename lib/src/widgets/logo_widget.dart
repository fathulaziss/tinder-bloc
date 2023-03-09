import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 143,
      height: 34,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.image('logo_image.png')),
        ),
      ),
    );
  }
}
