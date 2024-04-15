import 'package:flutter/material.dart';

class FirtstScreen extends StatelessWidget {
  const FirtstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/pictures/first_screen_bg.png',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(30, 36, 32, 0.3),
                Color.fromRGBO(30, 31, 36, 1)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
