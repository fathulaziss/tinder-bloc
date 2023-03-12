import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/domain/user.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullname,
            style: AppTextStyle.white(
              fontSize: AppFontSize.f28,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          Text('${user.age}, ${user.occupation}', style: AppTextStyle.black()),
          AppSpace.vertical(16),
          Text(
            user.description,
            style: AppTextStyle.white(),
          ),
          AppSpace.vertical(16),
        ],
      ),
    );
  }
}
