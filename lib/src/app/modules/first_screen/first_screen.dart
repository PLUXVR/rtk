import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/components/registration_or_login_widget.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/components/welcome_widget.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          const WelcomeWidget(),
        ],
      ),
      bottomSheet: const RegistrationOrLoginWidget(),
    );
  }
}
