import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 54,
            height: 76,
            child: Image.asset('assets/pictures/logo.png'),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Добро пожаловать",
            style: TextStyle(color: AppColors.textPrimaryEnabled, fontSize: 21),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Зарегистрируйтесь\n или войдите в приложение",
            style: TextStyle(
              color: AppColors.textPrimaryEnabled,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
