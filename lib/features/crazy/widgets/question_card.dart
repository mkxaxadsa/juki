import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../core/models/quiz.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.quiz,
    required this.id,
  });

  final Quiz quiz;
  final int id;

  String formatId(int id) => id.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xffCC00FF),
      padding: const EdgeInsets.all(1),
      radius: const Radius.circular(24),
      dashPattern: const [10, 10],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.64),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 28,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffFF730E),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    'Question',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 28,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff5FBD00),
                    ),
                    child: Center(
                      child: Text(
                        '${formatId(id)} / 12',
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
            ),
            const Spacer(),
            Text(
              quiz.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
