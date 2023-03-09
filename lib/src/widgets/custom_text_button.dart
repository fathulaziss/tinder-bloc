import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style:
            AppTextStyle.white().copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
