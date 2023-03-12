import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';
import 'package:tinder/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/banner_widget.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_field_widget.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  const SignUpAgeJobScreen({
    super.key,
    required this.fullname,
    required this.email,
    required this.password,
  });

  final String fullname;
  final String email;
  final String password;

  static const String routeName = '/sign-up-age-job';

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    jobController.clear();
    ageController.clear();
    jobController.dispose();
    ageController.dispose();
    super.dispose();
  }

  String? validateForm() {
    if (jobController.text.isEmpty || ageController.text.isEmpty) {
      return "Occupation or Age can't be empty";
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
                controller: jobController,
                hintText: 'Write your occupation',
                labelName: 'Occupation',
              ),
              CustomTextFieldWidget(
                controller: ageController,
                hintText: 'Write your age',
                labelName: 'Age',
              ),
              AppSpace.vertical(117),
              CustomButtonWidget(
                title: 'Continue Sign Up',
                onTap: () {
                  final message = validateForm();
                  if (message != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                    return;
                  }
                  final userAccount = UserAccount(
                    fullname: widget.fullname,
                    email: widget.email,
                    password: widget.password,
                    occupation: jobController.text,
                    age: ageController.text,
                  );
                  Navigator.pushNamed(
                    context,
                    SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
