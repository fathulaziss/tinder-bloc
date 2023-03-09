import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/banner_widget.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_field_widget.dart';

class SingUpAgeJobScreen extends StatefulWidget {
  const SingUpAgeJobScreen({super.key});

  static const String routeName = '/sign-up-age-job';

  @override
  State<SingUpAgeJobScreen> createState() => _SingUpAgeJobScreenState();
}

class _SingUpAgeJobScreenState extends State<SingUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    jobController.clear();
    ageController.clear();
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
              CustomButtonWidget(title: 'Continue Sign Up', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
