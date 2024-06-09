import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_rtk/src/app/widgets/step_bar/step_bar.dart';
import 'package:flutter_rtk/src/app/widgets/text_info_widget/text_info_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
  // final int stepsCount;
  const VerificationScreen({
    super.key,
    required this.phoneNumber,
    // required this.stepsCount,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final String trueInputCode = '000000';
  bool isWrongSmsCode = false;

  final pinCodeInputFieldsController = PincodeInputFieldsController();

  int _seconds = 60;

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: bodyBackgroundColor,
        appBar: DefaultAppBar(
          additionHeight: 20,
          titleText: "Шаг 2 из 5",
          bottomAppBarChild: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 120.0),
            child: StepBar(
              currentStep: 2,
              stepsCount: 5,
            ),
          ),
          leading: DefaultRectangleButton(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: SvgPicture.asset('assets/icons/arrow-left.svg'),
          ),
        ),
        body: ListView(
          children: [
            TextInfoWidget(
              headingText: "Подтвердите номер телефона",
              bodyText: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 12, color: Colors.white, height: 1.5),
                  children: [
                    const TextSpan(
                        text:
                            'Мы только что отправили 6-значный код \nна ваш номер телефона '),
                    TextSpan(
                        text: widget.phoneNumber,
                        style: const TextStyle(color: AppColors.orange300)),
                    const TextSpan(text: ':'),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color(0xFF24252B),
                  ),
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFF24252B),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(color: appBarBackground),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: PincodeInputFields(
                    showError: isWrongSmsCode,
                    controller: pinCodeInputFieldsController,
                    onInputComplete: () {
                      print('DONE');
                      print(pinCodeInputFieldsController.text);
                      setState(() {
                        if (pinCodeInputFieldsController.text ==
                            trueInputCode) {
                          Navigator.of(context)
                              .pushNamed('/passwordCreateScreen');
                        } else {
                          isWrongSmsCode = true;
                        }
                      });
                    },
                    length: 6,
                    heigth: 54,
                    width: 51,
                    borderRadius: BorderRadius.circular(9),
                    unfocusBorder: Border.all(
                      width: 1,
                      color: const Color(0xFF5B6774),
                    ),
                    focusBorder: Border.all(
                      width: 1,
                      color: const Color(0xFF9B71F4),
                    ),
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    focusFieldColor: const Color(0xFF2A2B32),
                    unfocusFieldColor: const Color(0xFF2A2B32),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: _seconds > 0
                          ? null
                          : () {
                              print('Timer');
                              _seconds = 60;
                              _startTimer();
                            },
                      child: AnimatedContainer(
                        height: 36,
                        width: 116,
                        duration: const Duration(
                          milliseconds: 50,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                          color: _seconds > 0
                              ? AppColors.neutal800
                              : AppColors.neutal700,
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/refresh-cw.svg',
                                colorFilter: ColorFilter.mode(
                                    _seconds > 0
                                        ? AppColors.textPrimaryDisabled
                                        : AppColors.textPrimaryEnabled,
                                    BlendMode.srcIn),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Text(
                                  'Не получил код',
                                  style: TextStyle(
                                      color: _seconds > 0
                                          ? AppColors.textPrimaryDisabled
                                          : Colors.white,
                                      fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray100),
                        children: [
                          const TextSpan(text: 'Попробовать снова через '),
                          const WidgetSpan(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          TextSpan(
                              text: "$_seconds",
                              style:
                                  const TextStyle(color: AppColors.orange300)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
