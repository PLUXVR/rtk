import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtk/src/app/widgets/check_box/check_box.dart';

// Виджет с чекбоксами для валидации полей ввода информациии о пользователе

class ValidationPasswordWidget extends StatelessWidget {
  final bool isAllValid;
  final DefaultCheckBox minSymbolsCheckBox;
  final DefaultCheckBox lowerAndUpperCaseCheckBox;
  final DefaultCheckBox personalInfoInPassCheckBox;

  const ValidationPasswordWidget({
    super.key,
    this.isAllValid = true,
    required this.minSymbolsCheckBox,
    required this.lowerAndUpperCaseCheckBox,
    required this.personalInfoInPassCheckBox,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Container(
          //     child: isAllValid
          //         ? Text(
          //             'надежный',
          //             style: TextStyle(
          //               fontSize: 13,
          //               color: doneTextColor,
          //             ),
          //           )
          //         : null,
          //   ),
          // ),
          const Row(
            children: [
              SizedBox(height: 16.0),
              Text(
                'Надежность пароля:',
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(239, 239, 239, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          minSymbolsCheckBox,
          const SizedBox(height: 12.0),
          lowerAndUpperCaseCheckBox,
          const SizedBox(height: 12.0),
          personalInfoInPassCheckBox,
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
