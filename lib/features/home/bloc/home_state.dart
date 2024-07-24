part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {
  final int coins;
  HomeInitial({required this.coins});
}

class HomeRules extends HomeState {}

class HomePrivacy extends HomeState {}

class HomeProfile extends HomeState {}
