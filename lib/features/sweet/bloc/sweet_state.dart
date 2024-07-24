part of 'sweet_bloc.dart';

abstract class SweetState {}

class SweetInitial extends SweetState {}

class RememberSweetState extends SweetState {
  final List<Sweet> sweets;
  RememberSweetState({required this.sweets});
}

class StartedSweetState extends SweetState {
  final List<Sweet> sweets;
  final int left;
  StartedSweetState({
    required this.sweets,
    required this.left,
  });
}

class FinishedSweetState extends SweetState {}

class LooseSweetState extends SweetState {}
