import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/presentation/explore_people_screen.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_button.dart';
import 'package:tinder/src/widgets/logo_and_tagline_widget.dart';
import 'package:tinder/src/widgets/upload_photo_widget.dart';

class SignUpUploadPhotoScreen extends StatelessWidget {
  const SignUpUploadPhotoScreen({super.key});

  static const String routeName = '/sign-up-upload-photo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoAndTaglineWidget(),
              AppSpace.vertical(50),
              const UploadPhotoWidget(),
              AppSpace.vertical(53),
              Text(
                'Andi Mania',
                style: AppTextStyle.white(
                  fontSize: AppFontSize.f22,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              AppSpace.vertical(4),
              Text('22, Lawyer', style: AppTextStyle.black60()),
              AppSpace.vertical(240),
              CustomButtonWidget(title: 'Update My Profile', onTap: () {}),
              AppSpace.vertical(20),
              CustomTextButton(
                title: 'Skip for Now',
                onPressed: () {
                  Navigator.pushNamed(context, ExplorePeopleScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
