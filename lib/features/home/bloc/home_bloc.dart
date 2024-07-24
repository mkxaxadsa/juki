import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(coins: mycoins)) {
    on<ChangePageEvent>((event, emit) {
      if (event.index == 0) {
        if (state is HomeInitial) return;
        emit(HomeInitial(coins: mycoins));
      } else if (event.index == 1) {
        if (state is HomeRules) return;
        emit(HomeRules());
      } else if (event.index == 2) {
        if (state is HomePrivacy) return;
        emit(HomePrivacy());
      } else {
        if (state is HomeProfile) return;
        emit(HomeProfile());
      }
    });

    on<GetCoinsEvent>((event, emit) {
      emit(HomeInitial(coins: mycoins));
    });
  }
}
