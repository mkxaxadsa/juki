part of 'sweet_bloc.dart';

abstract class SweetEvent {}

class RememberSweetEvent extends SweetEvent {}

class StartSweetEvent extends SweetEvent {}

class SelectSweetEvent extends SweetEvent {
  final Sweet sweet;
  SelectSweetEvent({required this.sweet});
}

class LooseSweetEvent extends SweetEvent {}
