import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../home/bloc/home_bloc.dart';
import '../bloc/crazy_bloc.dart';
import '../widgets/answer_card.dart';
import '../widgets/crazy_appbar.dart';
import '../widgets/crazy_scaffold.dart';
import '../widgets/question_card.dart';

class CrazyPage extends StatefulWidget {
  const CrazyPage({super.key});

  @override
  State<CrazyPage> createState() => _CrazyPageState();
}

class _CrazyPageState extends State<CrazyPage> {
  // context.read<CrazyBloc>().add(NextQuizEvent());
  Color color1 = const Color(0xff000000).withOpacity(0.7);
  Color color2 = const Color(0xff000000).withOpacity(0.7);
  Color color3 = const Color(0xff000000).withOpacity(0.7);
  Color color4 = const Color(0xff000000).withOpacity(0.7);
  bool canTap = true;

  void onTapAnswer(int id, Answer answer) async {
    if (canTap) {
      Color color = const Color(0xffE01D3E);
      if (answer.correct) color = const Color(0xff5FBD00);
      setState(() {
        if (id == 1) color1 = color;
        if (id == 2) color2 = color;
        if (id == 3) color3 = color;
        if (id == 4) color4 = color;
      });
      changeCoins(answer.correct);
      Future.delayed(const Duration(seconds: 1), () {
        context.read<CrazyBloc>().add(NextQuizEvent());
      });
    }
    canTap = false;
  }

  void setDefault(bool last) async {
    color1 = const Color(0xff2D034F);
    color2 = const Color(0xff2D034F);
    color3 = const Color(0xff2D034F);
    color4 = const Color(0xff2D034F);
    if (last) {
      context.go('/home/spinner');
    } else {
      canTap = true;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CrazyBloc>().add(GetQuizesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CrazyScaffold(
      body: Column(
        children: [
          const SizedBox(height: 18),
          const CrazyAppbar(),
          const SizedBox(height: 40),
          BlocListener<CrazyBloc, CrazyState>(
            listener: (context, state) {
              if (state is LoadedQuizState) {
                setDefault(false);
                context.read<HomeBloc>().add(GetCoinsEvent());
              }

              if (state is FinishedQuizState) {
                setDefault(true);
              }
            },
            child: BlocBuilder<CrazyBloc, CrazyState>(
              builder: (context, state) {
                if (state is LoadedQuizState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        QuestionCard(
                          quiz: state.quiz,
                          id: state.id,
                        ),
                        const SizedBox(height: 63),
                        Row(
                          children: [
                            AnswerCard(
                              answer: state.quiz.answers[0],
                              variant: 'A',
                              color: color1,
                              onPressed: () {
                                onTapAnswer(1, state.quiz.answers[0]);
                              },
                            ),
                            const SizedBox(width: 16),
                            AnswerCard(
                              answer: state.quiz.answers[1],
                              variant: 'B',
                              color: color2,
                              onPressed: () {
                                onTapAnswer(2, state.quiz.answers[1]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            AnswerCard(
                              answer: state.quiz.answers[2],
                              variant: 'C',
                              color: color3,
                              onPressed: () {
                                onTapAnswer(3, state.quiz.answers[2]);
                              },
                            ),
                            const SizedBox(width: 16),
                            AnswerCard(
                              answer: state.quiz.answers[3],
                              variant: 'D',
                              color: color4,
                              onPressed: () {
                                onTapAnswer(4, state.quiz.answers[3]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
