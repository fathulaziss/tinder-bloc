import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/banner_widget.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_button.dart';
import 'package:tinder/src/widgets/custom_text_field_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BannerWidget(),
              CustomTextFieldWidget(
                controller: nameController,
                hintText: 'Write your name',
                labelName: 'Complete Name',
              ),
              CustomTextFieldWidget(
                controller: emailController,
                hintText: 'Write your email address',
                labelName: 'Email Address',
              ),
              CustomTextFieldWidget(
                controller: passwordController,
                hintText: 'Write your security',
                labelName: 'Password',
                isObsecure: true,
              ),
              AppSpace.vertical(16),
              CustomButtonWidget(
                title: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, SingUpAgeJobScreen.routeName);
                },
              ),
              AppSpace.vertical(20),
              CustomTextButton(title: 'Sign In to My Account', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
