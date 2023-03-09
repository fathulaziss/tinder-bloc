import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/explore_people_app_bar_widget.dart';
import 'package:tinder/src/widgets/explore_people_button_widget.dart';
import 'package:tinder/src/widgets/match_card_widget.dart';

class ExplorePeopleScreen extends StatelessWidget {
  const ExplorePeopleScreen({super.key});

  static const String routeName = '/explore-people';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            const ExplorePeopleAppBarWidget(),
            AppSpace.vertical(50),
            Expanded(
              child: Column(
                children: [
                  const Expanded(child: MatchCardWidget()),
                  AppSpace.vertical(50),
                  const ExplorePeopleButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
