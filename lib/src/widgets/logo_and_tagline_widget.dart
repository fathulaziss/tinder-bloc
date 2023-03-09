import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/logo_widget.dart';

class LogoAndTaglineWidget extends StatelessWidget {
  const LogoAndTaglineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoWidget(),
        AppSpace.vertical(6),
        Text('Find your perfect love.', style: AppTextStyle.white())
      ],
    );
  }
}
