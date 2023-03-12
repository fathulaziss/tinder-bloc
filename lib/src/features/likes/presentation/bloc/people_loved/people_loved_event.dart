part of 'people_loved_bloc.dart';

@immutable
abstract class PeopleLovedEvent {}

class OnPeopleLovedEventCalled extends PeopleLovedEvent {}

class AddPeopleLoved extends PeopleLovedEvent {
  AddPeopleLoved({required this.user});

  final User user;
}
