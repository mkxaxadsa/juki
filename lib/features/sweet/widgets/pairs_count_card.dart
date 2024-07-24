import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PairsCountCard extends StatelessWidget {
  const PairsCountCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          const SizedBox(width: 2),
          Container(
            height: 36,
            width: 92,
            decoration: BoxDecoration(
              color: const Color(0xff9083EF),
              borderRadius: BorderRadius.circular(44),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/sweet/pairs.svg'),
                const SizedBox(width: 3),
                const Text(
                  'Pairs Left',
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
            '$index / 15',
            style: const TextStyle(
              color: Colors.black,
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
