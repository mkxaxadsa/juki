import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/quiz.dart';

part 'crazy_event.dart';
part 'crazy_state.dart';

class CrazyBloc extends Bloc<CrazyEvent, CrazyState> {
  int id = 0;
  List<Quiz> sortedQuizes = [];

  CrazyBloc() : super(CrazyInitial()) {
    on<GetQuizesEvent>((event, emit) {
      id = 0;
      sortedQuizes = [];
      for (Quiz quiz in quizes) {
        quiz.answers.shuffle();
        sortedQuizes.add(quiz);
      }
      sortedQuizes.shuffle();
      emit(LoadedQuizState(quiz: sortedQuizes[id], id: id + 1));
    });

    on<NextQuizEvent>((event, emit) {
      id = id + 1;
      if (id <= 11) emit(LoadedQuizState(quiz: sortedQuizes[id], id: id + 1));
      if (id == 12) emit(FinishedQuizState());
    });
  }
}
