import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shyna',
            style: AppTextStyle.white(
              fontSize: AppFontSize.f28,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          Text('22, Lawyer', style: AppTextStyle.black()),
          AppSpace.vertical(16),
          Text(
            'I love solving problem in terms of finance, business, and any case. With you, we will solve all world problems.',
            style: AppTextStyle.white(),
          ),
          AppSpace.vertical(16),
        ],
      ),
    );
  }
}
