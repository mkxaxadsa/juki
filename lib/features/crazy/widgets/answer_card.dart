import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/quiz.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answer,
    required this.variant,
    required this.color,
    required this.onPressed,
  });

  final Answer answer;
  final String variant;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: color == const Color(0xff2d034f) ? 0 : 200,
        ),
        height: 93,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          // boxShadow: [
          //   const BoxShadow(
          //     color: Color(0xffFF730E),
          //   ),
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.7),
          //     spreadRadius: -6,
          //     blurRadius: 16,
          //   ),
          // ],
        ),
        child: CupertinoButton(
          onPressed: color == const Color(0xff2d034f) ? onPressed : null,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: color == const Color(0xff2d034f)
                          ? const Color(0xffFF730E)
                          : Colors.black,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Center(
                      child: Text(
                        variant,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                answer.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 34),
            ],
          ),
        ),
      ),
    );
  }
}
