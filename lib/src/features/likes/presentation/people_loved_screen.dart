import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder/src/features/likes/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:tinder/src/themes/app_font.dart';
import 'package:tinder/src/themes/app_style.dart';
import 'package:tinder/src/widgets/people_love_card_widget.dart';

class PeopleLovedScreen extends StatefulWidget {
  const PeopleLovedScreen({Key? key}) : super(key: key);

  static const String routeName = '/people-loved';

  @override
  State<PeopleLovedScreen> createState() => _PeopleLovedScreenState();
}

class _PeopleLovedScreenState extends State<PeopleLovedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PeopleLovedBloc>().add(OnPeopleLovedEventCalled());
  }

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
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {
              if (state is PeopleLovedLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is PeopleLovedLoaded) {
                final users = state.userMatch;
                return users.isEmpty
                    ? Center(
                        child: Text(
                          'No Data User Match',
                          style: AppTextStyle.white(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return PeopleLoveCardWidget(user: users[index]);
                          },
                        ),
                      );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
