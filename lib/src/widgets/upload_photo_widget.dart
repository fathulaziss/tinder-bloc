import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_color.dart';

class UploadPhotoWidget extends StatelessWidget {
  const UploadPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.secondary,
              width: 8,
              strokeAlign: StrokeAlign.outside,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AppAsset.image('profile_icon.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(AppAsset.image('icon_add_color.png')),
          ),
        )
      ],
    );
  }
}
