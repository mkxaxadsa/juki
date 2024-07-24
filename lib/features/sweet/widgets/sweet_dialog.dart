import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../home/bloc/home_bloc.dart';
import '../bloc/sweet_bloc.dart';

class SweetDialog extends StatelessWidget {
  const SweetDialog({super.key, required this.error});

  final bool error;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!error)
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/ellipse3.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DottedBorder(
                  color:
                      error ? const Color(0xffFF3E60) : const Color(0xff42FF00),
                  padding: const EdgeInsets.all(1),
                  radius: const Radius.circular(24),
                  dashPattern: const [10, 10],
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: error
                          ? const Color(0xff96001A)
                          : const Color(0xff42FF00).withOpacity(0.64),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: error ? 140 : 124,
                          color: error
                              ? const Color(0xff96001A)
                              : const Color(0xff42FF00),
                          offset: Offset(0, error ? 30 : 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        if (error) const Spacer(),
                        const SizedBox(height: 30),
                        Container(
                          height: 31,
                          width: error ? 90 : 157,
                          decoration: BoxDecoration(
                            color: const Color(0xffFF730E),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              child: Text(
                                error ? 'You Lose' : 'Congratulations!',
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                          child: Text(error
                              ? 'Unfortunately you didn\'t manage to get\nall the pairs together and time ran out.\nTry again'
                              : 'You have won an additional\n+100 coins'),
                        ),
                        const Spacer(),
                        if (!error)
                          Container(
                            height: 32,
                            width: 55,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/coin.svg',
                                ),
                                const Spacer(),
                                const DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                  child: Text('100'),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 172,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffBD7D02),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFFC700),
                        Color(0xffFF7A00),
                      ],
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: () async {
                      if (error) {
                        context.read<SweetBloc>().add(RememberSweetEvent());
                        context.pop();
                      } else {
                        await saveCoins(100).then((value) {
                          context.read<HomeBloc>().add(GetCoinsEvent());
                          context.pop();
                          context.pop();
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: Text(
                        error ? 'Try Again' : 'Receive',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffBD7D02),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffEE29FF),
                        Color(0xffAD1DE0),
                      ],
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: () async {
                      context.pop();
                      context.pop();
                    },
                    padding: EdgeInsets.zero,
                    child: const Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
