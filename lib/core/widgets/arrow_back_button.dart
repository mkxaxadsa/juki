import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/home/bloc/home_bloc.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key, this.canPop = true});

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        if (canPop) {
          Navigator.pop(context);
          context.read<HomeBloc>().add(GetCoinsEvent());
        }
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 32,
        width: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xff1F7600),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5FBD00),
              Color(0xff6AD300),
              Color(0xff0E8104),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/back.svg'),
            const SizedBox(width: 4),
            const Text(
              'Back',
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
    );
  }
}
