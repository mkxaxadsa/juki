import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CrazyCard extends StatelessWidget {
  const CrazyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/home/crazy');
      },
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff088A2D).withOpacity(0.6),
                        const Color(0xff088A2D).withOpacity(0.3),
                        const Color(0xffB500D2).withOpacity(0.5),
                        const Color(0xffB500D2).withOpacity(0.5),
                        Colors.transparent,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 27,
                          width: 77,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: const Center(
                            child: Text(
                              'Crazy Time',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: SvgPicture.asset('assets/crazy1.svg'),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 8,
                        child: SvgPicture.asset('assets/crazy2.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 104,
              child: Image.asset(
                'assets/girl.png',
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
