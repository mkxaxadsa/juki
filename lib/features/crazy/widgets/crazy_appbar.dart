import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/arrow_back_button.dart';
import '../../../core/widgets/my_coins.dart';

class CrazyAppbar extends StatelessWidget {
  const CrazyAppbar({super.key, this.canPop = true});

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          const SizedBox(width: 24),
          ArrowBackButton(canPop: canPop),
          const SizedBox(width: 17),
          const _Logo(),
          const Spacer(),
          const MyCoins(),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 2),
          SvgPicture.asset('assets/crazy_logo.svg'),
          const Spacer(),
          const Text(
            'Crazy Time',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
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
