import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  void load() async {
    await getData().then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/home');
      });
    });
  }

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    load();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      colors: const [
        Color(0xff87007A),
        Color(0xff1000CC),
      ],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo.svg'),
            const SizedBox(height: 50),
            RotationTransition(
              turns: Tween(begin: 1.0, end: 0.0).animate(_animationController),
              child: const GradientCircularProgressIndicator(radius: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final double strokeWidth;

  const GradientCircularProgressIndicator({
    super.key,
    required this.radius,
    this.strokeWidth = 7,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: 24,
        strokeWidth: 7,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.strokeWidth,
  });

  final double radius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(
          size.width - strokeWidth,
          size.height - strokeWidth,
        );
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
      colors: [
        const Color(0xffFF00E5),
        const Color(0xffFF00E5).withOpacity(0),
      ],
      startAngle: 0.0,
      endAngle: 2 * pi,
    ).createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
