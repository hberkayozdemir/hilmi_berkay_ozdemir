import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hilmi_berkay_ozdemir/app/features/home/view/home_view.dart';

class WebPage extends CustomTransitionPage {
  WebPage(
      {LocalKey? key,
      // other properties taken from `MaterialPage`
      required Widget child})
      : super(
            child: child,
            key: key,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  alwaysIncludeSemantics: true,
                  key: key,
                  child: child,
                ));
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
      pageBuilder: (context, state) => WebPage(
        key: state.pageKey,
        child: const HomeView(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomeView(),
          pageBuilder: (context, state) => WebPage(
            key: state.pageKey,
            child: const HomeView(),
          ),
        ),
      ],
    ),
  ],
);
