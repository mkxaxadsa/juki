import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../core/utils.dart';
import '../../home/bloc/home_bloc.dart';
import '../widgets/crazy_appbar.dart';
import '../widgets/crazy_scaffold.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  double turns = 0.0;
  double angle = 0;
  bool buttonVisible = true;
  bool canPop = true;

  List<double> angles = [
    2, // 15
    4, // 5
    14, // 10
    16, // 20
    20, // 1
  ];

  int getCoins() {
    if (angle == 2) {
      return 15;
    } else if (angle == 4) {
      return 5;
    } else if (angle == 14) {
      return 10;
    } else if (angle == 16) {
      return 20;
    } else {
      return 1;
    }
  }

  void onSpin() {
    setState(() {
      canPop = false;
      buttonVisible = false;
      turns += 5 / 1;
    });
    getRandom();
    Future.delayed(const Duration(seconds: 7), () {
      showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return _Dialog(getCoins());
        },
      );
    });
  }

  void getRandom() {
    Random random = Random();
    int randomIndex = random.nextInt(angles.length);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        angle = angles[randomIndex];
        print(angle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CrazyScaffold(
      body: Column(
        children: [
          const SizedBox(height: 18),
          CrazyAppbar(canPop: canPop),
          const SizedBox(height: 40),
          const Text(
            'Get the opportunity to earn extra\npoints by spinning the wheel.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Positioned(
                bottom: 14,
                right: -10,
                left: -10,
                child: Container(
                  height: 422,
                  width: 422,
                  decoration: BoxDecoration(
                    color: const Color(0xff2A0071),
                    borderRadius: BorderRadius.circular(220),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
                child: Transform.rotate(
                  angle: angle,
                  child: AnimatedRotation(
                    duration: const Duration(seconds: 6),
                    curve: Curves.easeInOutCirc,
                    turns: turns,
                    child: SizedBox(
                      // width: 400,
                      height: 400,
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset('assets/spinner0.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner1.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner2.svg'),
                          ),
                          Center(
                            child: SvgPicture.asset('assets/spinner3.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/spinner4.svg'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          if (buttonVisible) _SpinButton(onSpin),
          // _SpinButton(() {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const _Dialog(150);
          //     },
          //   );
          // })
        ],
      ),
    );
  }
}

class _SpinButton extends StatelessWidget {
  const _SpinButton(this.onPressed);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 172,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff1F7600)),
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
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: const Center(
          child: Text(
            'Spin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog(this.coins);

  final int coins;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/ellipse2.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Container(
        //     height: 500,
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.7),
        //           blurRadius: 20,
        //           spreadRadius: 0,
        //           offset: const Offset(1, 1),
        //         ),
        //       ],
        //       color: Colors.black.withOpacity(0.1),
        //     ),
        //   ),
        // ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/ellipse1.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Image.asset('assets/girl.png'),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 90,
            ),
            child: Column(
              children: [
                DottedBorder(
                  color: const Color(0xff42FF00),
                  padding: const EdgeInsets.all(1),
                  radius: const Radius.circular(24),
                  dashPattern: const [10, 10],
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff42FF00).withOpacity(0.64),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          height: 31,
                          width: 157,
                          decoration: BoxDecoration(
                            color: const Color(0xffFF730E),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              child: Text('Congratulations!'),
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
                          child:
                              Text('You have won an additional\n+$coins coins'),
                        ),
                        const Spacer(),
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
                              DefaultTextStyle(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                                child: Text(coins.toString()),
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
                      await saveCoins(coins).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                        context.pop();
                        context.pop();
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const Center(
                      child: Text(
                        'Receive',
                        style: TextStyle(
                          color: Colors.black,
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
