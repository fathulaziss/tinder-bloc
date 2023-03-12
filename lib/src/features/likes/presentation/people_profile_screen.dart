import 'package:flutter/material.dart';
import 'package:tinder/src/features/likes/data/data_hobby_dummy.dart';
import 'package:tinder/src/features/likes/domain/user.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/people_identity_widget.dart';
import 'package:tinder/src/widgets/profile_detail_image_widget.dart';

class PeopleProfileScreen extends StatelessWidget {
  const PeopleProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/people-profile';

  @override
  Widget build(BuildContext context) {
    late User user;
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data != null) {
      user = data as User;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetailImageWidget(user: user),
            AppSpace.vertical(30),
            PeopleIdentityWidget(user: user),
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 24),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataHobbyDummy.length,
                itemBuilder: (context, index) {
                  final hobby = dataHobbyDummy[index];
                  return Container(
                    width: 120,
                    height: 80,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(hobby),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: CustomButtonWidget(title: 'Chat Now', onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
