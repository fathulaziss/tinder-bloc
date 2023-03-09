import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';

class MatchButtonWidget extends StatelessWidget {
  const MatchButtonWidget({
    Key? key,
    this.dimension = 50,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  final double dimension;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAsset.image(iconPath)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
