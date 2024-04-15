import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class RegistrationOrLoginWidget extends StatelessWidget {
  const RegistrationOrLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 32,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color(0xFF24252B)),
        ),
      ),
      child: SizedBox(
        height: 62,
        child: ElevatedButton(
          style: ButtonStyle(
              shadowColor: const MaterialStatePropertyAll(Colors.black),
              elevation: const MaterialStatePropertyAll(5),
              backgroundColor: MaterialStatePropertyAll(buttonNextColorActive),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ))),
          onPressed: () {
            print('Кнопка далее нажата');
          },
          child: Text(
            'Далее',
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
