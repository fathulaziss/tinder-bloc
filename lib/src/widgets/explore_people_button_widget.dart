import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tinder/src/widgets/match_button_widget.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({Key? key, required this.controller})
      : super(key: key);

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'icon_close.png',
          onTap: () {
            controller.swipeLeft();
          },
        ),
        MatchButtonWidget(
          dimension: 80,
          iconPath: 'icon_love.png',
          onTap: () {},
        ),
        MatchButtonWidget(
          iconPath: 'icon_favorite.png',
          onTap: () {
            controller.swipeRight();
          },
        ),
      ],
    );
  }
}
