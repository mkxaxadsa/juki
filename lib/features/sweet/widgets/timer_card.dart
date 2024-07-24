import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.sec});

  final int sec;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 117,
      decoration: BoxDecoration(
        color: const Color(0xff471993).withOpacity(0.7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          const SizedBox(width: 2),
          Container(
            height: 36,
            width: 52,
            decoration: BoxDecoration(
              color: const Color(0xff471993),
              borderRadius: BorderRadius.circular(44),
            ),
            child: Column(
              children: [
                const SizedBox(height: 3),
                SvgPicture.asset('assets/sweet/timer.svg'),
                const Text(
                  'Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            formatTimer(sec),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
