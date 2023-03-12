part of 'people_loved_bloc.dart';

@immutable
abstract class PeopleLovedState {}

class PeopleLovedInitial extends PeopleLovedState {}

class PeopleLovedLoading extends PeopleLovedState {}

class PeopleLovedLoaded extends PeopleLovedState {
  PeopleLovedLoaded({required this.userMatch});

  final List<User> userMatch;
}
