import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_color.dart';
import 'package:tinder/src/themes/app_style.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelName,
    this.isObsecure = false,
  });

  final String labelName;
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelName, style: AppTextStyle.white()),
        AppSpace.vertical(8),
        TextField(
          controller: controller,
          obscureText: isObsecure,
          style: AppTextStyle.white(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            filled: true,
            fillColor: AppColor.secondary,
            hintText: hintText,
            hintStyle: AppTextStyle.black30(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
        AppSpace.vertical(14),
      ],
    );
  }
}
