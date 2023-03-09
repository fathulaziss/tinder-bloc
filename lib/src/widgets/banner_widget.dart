import 'package:flutter/material.dart';
import 'package:tinder/src/widgets/hero_widget.dart';
import 'package:tinder/src/widgets/logo_and_tagline_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [LogoAndTaglineWidget(), HeroWidget()],
    );
  }
}
