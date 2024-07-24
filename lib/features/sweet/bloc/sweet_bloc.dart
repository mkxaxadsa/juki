import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/sweet.dart';

part 'sweet_event.dart';
part 'sweet_state.dart';

class SweetBloc extends Bloc<SweetEvent, SweetState> {
  List<Sweet> sweets = sweetsList;
  bool check = false;
  Sweet? sweet1;
  Sweet? sweet2;
  int left = 0;

  SweetBloc() : super(SweetInitial()) {
    on<RememberSweetEvent>((event, emit) {
      for (Sweet sweet in sweets) {
        sweet.visible = true;
        sweet.done = false;
      }
      sweets.shuffle();
      sweet1 = null;
      sweet2 = null;
      left = 0;
      check = false;
      emit(RememberSweetState(sweets: sweets));
    });

    on<StartSweetEvent>((event, emit) {
      for (Sweet sweet in sweets) {
        sweet.visible = false;
      }
      emit(StartedSweetState(
        sweets: sweets,
        left: left,
      ));
    });

    on<LooseSweetEvent>((event, emit) {
      emit(LooseSweetState());
    });

    on<SelectSweetEvent>((event, emit) async {
      if (sweet1 != null && sweet2 != null) return;
      if (event.sweet.done) return;
      if (check) {
        for (Sweet sweet in sweets) {
          if (sweet == event.sweet) sweet.visible = true;
          sweet2 = event.sweet;
        }
        emit(StartedSweetState(
          sweets: sweets,
          left: left,
        ));
        if (sweet1 != null &&
            sweet2 != null &&
            sweet1!.asset != sweet2!.asset) {
          await Future.delayed(const Duration(milliseconds: 500), () {
            for (Sweet sweet in sweets) {
              if (sweet.done == false) sweet.visible = false;
            }
            sweet1 = null;
            sweet2 = null;
            check = false;
            emit(StartedSweetState(
              sweets: sweets,
              left: left,
            ));
          });
        } else {
          await Future.delayed(const Duration(milliseconds: 500), () {
            for (Sweet sweet in sweets) {
              if (sweet.asset == sweet1!.asset) sweet.done = true;
              if (sweet.asset == sweet2!.asset) sweet.done = true;
            }
            sweet1 = null;
            sweet2 = null;
            check = false;
            left = left + 1;
            if (left == 15) {
              emit(FinishedSweetState());
            } else {
              emit(StartedSweetState(
                sweets: sweets,
                left: left,
              ));
            }
          });
        }
      } else {
        for (Sweet sweet in sweets) {
          if (sweet == event.sweet) sweet.visible = true;
          check = true;
          sweet1 = event.sweet;
        }
        emit(StartedSweetState(
          sweets: sweets,
          left: left,
        ));
      }
    });
  }
}
