import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.colors = const [],
  });

  final Widget body;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          if (colors.isNotEmpty)
            Container(
              height: MediaQuery.of(context).viewPadding.top,
              color: const Color(0xff87007A),
              // color: Colors.white,
            ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffE8F1F3),
                    gradient: colors.isNotEmpty
                        ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: colors,
                          )
                        : null,
                  ),
                ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
