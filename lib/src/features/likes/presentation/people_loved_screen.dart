import 'package:flutter/material.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/people_love_card_widget.dart';

class PeopleLovedScreen extends StatelessWidget {
  const PeopleLovedScreen({Key? key}) : super(key: key);

  static const String routeName = '/people-loved';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'People You\nLoved',
          style: AppTextStyle.white(
            fontWeight: AppFontWeight.semiBold,
            fontSize: AppFontSize.f20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          AppSpace.vertical(50),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PeopleLoveCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
