import 'dart:ui';

import 'package:flutter/material.dart';

class CrazyScaffold extends StatelessWidget {
  const CrazyScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff87007A).withOpacity(0.7),
                      const Color(0xff1000CC).withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
