import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/banner_widget.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_button.dart';
import 'package:tinder/src/widgets/custom_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  String? validateForm() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return "Name or Email or Password can't be empty";
    }

    if (nameController.text.length < 4 ||
        emailController.text.length < 4 ||
        passwordController.text.length < 4) {
      return 'Too short, minimum 4 characters';
    }

    if (!emailController.text.contains('@')) {
      return 'Email invalid without @';
    }

    return null;
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
                  final message = validateForm();
                  if (message != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpAgeJobScreen(
                          fullname: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                  );
                  // Navigator.pushNamed(context, SingUpAgeJobScreen.routeName);
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
