import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [AppColor.pink, AppColor.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.white(fontWeight: AppFontWeight.semiBold),
        ),
      ),
    );
  }
}
