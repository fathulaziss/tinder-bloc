import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';
import 'package:tinder/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:tinder/src/features/likes/presentation/explore_people_screen.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/utils/image_picker_util.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/custom_text_button.dart';
import 'package:tinder/src/widgets/logo_and_tagline_widget.dart';
import 'package:tinder/src/widgets/upload_photo_widget.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  const SignUpUploadPhotoScreen({super.key});

  static const String routeName = '/sign-up-upload-photo';

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;
  late UserAccount userAccount;

  Future<void> getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      userAccount = data as UserAccount;
    }

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              ExplorePeopleScreen.routeName,
              (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndTaglineWidget(),
                AppSpace.vertical(50),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  getImageProfile(GetImageFrom.camera);
                                },
                                icon: const Icon(Icons.camera, size: 50),
                              ),
                              IconButton(
                                onPressed: () {
                                  getImageProfile(GetImageFrom.gallery);
                                },
                                icon: const Icon(Icons.photo, size: 50),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: UploadPhotoWidget(image: image),
                ),
                AppSpace.vertical(53),
                Text(
                  userAccount.fullname,
                  style: AppTextStyle.white(
                    fontSize: AppFontSize.f22,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                AppSpace.vertical(4),
                Text(
                  '${userAccount.age}, ${userAccount.occupation}',
                  style: AppTextStyle.black60(),
                ),
                AppSpace.vertical(240),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButtonWidget(
                      title: 'Update My Profile',
                      onTap: () {
                        userAccount.imageProfile = image!.path;
                        context.read<AuthBloc>().add(
                              RegisterAuthEvent(
                                userAccount: userAccount,
                                isRegister: true,
                              ),
                            );
                      },
                    );
                  },
                ),
                AppSpace.vertical(20),
                CustomTextButton(
                  title: 'Skip for Now',
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          RegisterAuthEvent(
                            userAccount: userAccount,
                            isRegister: true,
                          ),
                        );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
