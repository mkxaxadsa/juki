import 'package:go_router/go_router.dart';

import '../../features/crazy/pages/crazy_page.dart';
import '../../features/crazy/pages/spinner_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/sweet/pages/sweet_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'crazy',
          builder: (context, state) => const CrazyPage(),
        ),
        GoRoute(
          path: 'spinner',
          builder: (context, state) => const SpinnerPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/sweet',
      builder: (context, state) => const SweetPage(),
    ),
    // GoRoute(
    //   path: '/crazy',
    //   builder: (context, state) => const CrazyPage(),
    // ),
  ],
);
