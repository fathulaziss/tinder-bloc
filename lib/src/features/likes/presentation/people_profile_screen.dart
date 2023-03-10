import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_asset.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/custom_button_widget.dart';
import 'package:tinder/src/widgets/people_identity_widget.dart';
import 'package:tinder/src/widgets/profile_detail_image_widget.dart';

class PeopleProfileScreen extends StatelessWidget {
  const PeopleProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/people-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileDetailImageWidget(),
            AppSpace.vertical(30),
            const PeopleIdentityWidget(),
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 24),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    height: 80,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(AppAsset.image('hobby1_image.png')),
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
