import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_coins.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 121,
          decoration: const BoxDecoration(
            color: Color(0xffBF6EFF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
        ),
        Container(
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xff82017E),
                Color(0xff411A94),
              ],
            ),
          ),
          padding: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              const SizedBox(width: 24),
              SvgPicture.asset('assets/logo.svg', height: 36),
              const Spacer(),
              const MyCoins(),
              const SizedBox(width: 24),
              // const SizedBox(width: 14),
              // const _RegisterButton(),
              // const SizedBox(width: 7),
              // const _LoginButton(),
              // const SizedBox(width: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      minSize: 32,
      child: Container(
        height: 32,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xff1F7600),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff6AD300),
              Color(0xff0E8104),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      minSize: 32,
      child: Container(
        height: 32,
        width: 70,
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
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
