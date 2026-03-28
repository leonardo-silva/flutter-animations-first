import 'package:flutter/material.dart';

Route sliderRouteTransition(
  Widget nextScreen, {
  Duration duration = const Duration(milliseconds: 1000),
  Curve curve = Curves.ease,
  Offset beginPosition = const Offset(1, 0),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(begin: beginPosition, end: Offset.zero)
              .chain(CurveTween(curve: curve)),
        ),
        child: child,
      );
    },
  );
}
