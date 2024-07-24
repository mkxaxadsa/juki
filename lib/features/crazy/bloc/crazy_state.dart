part of 'crazy_bloc.dart';

abstract class CrazyState {}

class CrazyInitial extends CrazyState {}

class LoadedQuizState extends CrazyState {
  final Quiz quiz;
  final int id;
  LoadedQuizState({
    required this.quiz,
    required this.id,
  });
}

class FinishedQuizState extends CrazyState {}
