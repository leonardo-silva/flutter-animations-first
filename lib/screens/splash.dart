import 'package:flutter/material.dart';
import 'package:grimorio/route_transitions.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:grimorio/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _imageOpacity = 0;
  int timeToAnimationInMilliseconds = 2000;

  @override
  void initState() {
    super.initState();
    waitAndShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.modalBackgroundGradient[2],
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Image.asset(
                'assets/images/grimorio_1152.png',
                width: 300,
              ),
            ),
            AnimatedOpacity(
              opacity: _imageOpacity,
              duration: Duration(milliseconds: timeToAnimationInMilliseconds),
              curve: Curves.easeIn,
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Image.asset(
                  'assets/images/grimorio_titulo_1152.png',
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 700)).then((value) {
      setState(() {
        _imageOpacity = 1;
      });
      waitAndNextScreen();
    });
  }

  waitAndNextScreen() {
    Future.delayed(Duration(milliseconds: timeToAnimationInMilliseconds + 300))
        .then((value) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context,
          sliderRouteTransition(const Dashboard(),
              beginPosition: const Offset(0, 1)));
    });
  }
}
