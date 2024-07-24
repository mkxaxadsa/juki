import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SweetCard extends StatelessWidget {
  const SweetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/sweet');
      },
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/sweet.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              right: 100,
              left: 100,
              child: Image.asset(
                'assets/sweet2.png',
                height: 180,
              ),
            ),
            Positioned(
              bottom: -20,
              right: 0,
              left: 0,
              child: SvgPicture.asset('assets/sweet1.svg'),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Container(
                height: 27,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(27),
                ),
                child: const Center(
                  child: Text(
                    'Sweet',
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
          ],
        ),
      ),
    );
  }
}
