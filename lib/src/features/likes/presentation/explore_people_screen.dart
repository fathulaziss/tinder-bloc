import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/src/features/authentication/data/data_user_account_local.dart';
import 'package:tinder/src/features/authentication/domain/user_account.dart';
import 'package:tinder/src/features/likes/presentation/bloc/explore_people/explore_people_bloc.dart';
import 'package:tinder/src/features/likes/presentation/bloc/people_loved/people_loved_bloc.dart';
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
  final cardController = AppinioSwiperController();

  @override
  void initState() {
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    getDataUserAccount();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
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
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ExplorePeopleLoaded) {
                  final users = state.result;
                  final cards = <Widget>[];
                  for (final user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AppinioSwiper(
                            controller: cardController,
                            cards: cards,
                            direction: AppinioSwiperDirection.top,
                            padding: EdgeInsets.zero,
                            onSwipe: (
                              int index,
                              AppinioSwiperDirection direction,
                            ) {
                              if (direction == AppinioSwiperDirection.top) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yey, you matched with ${users[index].fullname}',
                                    ),
                                  ),
                                );
                              }

                              if (direction != AppinioSwiperDirection.left &&
                                  direction != AppinioSwiperDirection.right &&
                                  direction != AppinioSwiperDirection.bottom) {
                                context
                                    .read<PeopleLovedBloc>()
                                    .add(AddPeopleLoved(user: users[index]));
                              }
                            },
                            onEnd: () {
                              context
                                  .read<ExplorePeopleBloc>()
                                  .add(OnExplorePeopleEventCalled());
                            },
                          ),
                        ),
                        AppSpace.vertical(50),
                        ExplorePeopleButtonWidget(controller: cardController),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
