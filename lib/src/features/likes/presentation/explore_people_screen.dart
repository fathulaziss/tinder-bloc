import 'package:flutter/material.dart';
import 'package:tinder/src/features/authentication/data/data_user_account_local.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/explore_people_app_bar_widget.dart';
import 'package:tinder/src/widgets/explore_people_button_widget.dart';
import 'package:tinder/src/widgets/match_card_widget.dart';

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  static const String routeName = '/explore-people';

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? userAccount;

  @override
  void initState() {
    super.initState();
    getDataUserAccount();
  }

  Future<void> getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    userAccount = result;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            ExplorePeopleAppBarWidget(imagePath: userAccount?.imageProfile),
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
