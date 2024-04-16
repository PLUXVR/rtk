import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/components/dd.dart';

class RegistrationOrLoginWidget extends StatelessWidget {
  const RegistrationOrLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 32,
          ),
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [Colors.transparent, Color.fromRGBO(30, 31, 36, 1)]),
          // ),
          decoration: BoxDecoration(color: Color.fromRGBO(30, 31, 36, 1)),
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              style: ButtonStyle(
                  shadowColor: const MaterialStatePropertyAll(Colors.black),
                  elevation: const MaterialStatePropertyAll(5),
                  backgroundColor:
                      MaterialStatePropertyAll(buttonNextColorActive),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
              onPressed: () {
                print('Кнопка далее нажата');
              },
              child: Text(
                'Регистрация',
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
        const DivTextDiv(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 32,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(30, 31, 36, 1),
          ),
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: textLogInButton)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
              onPressed: () {
                print('Кнопка далее нажата');
              },
              child: Text(
                'Войти',
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
