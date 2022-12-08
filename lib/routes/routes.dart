import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
