import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_rtk/src/app/widgets/step_bar/step_bar.dart';
import 'package:flutter_rtk/src/app/widgets/text_info_widget/text_info_widget.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends StatefulWidget {
  // final int stepsCount;
  const VerificationScreen({
    super.key,
    // required this.stepsCount,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              text: const TextSpan(
                style: TextStyle(fontSize: 12, color: Colors.white),
                children: [
                  TextSpan(
                      text:
                          'Мы только что отправили 6-значный код \nна ваш почтовый адрес '),
                  WidgetSpan(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  TextSpan(
                      text: '+7 (999) 999 99 99',
                      style: TextStyle(color: AppColors.orange300)),
                  TextSpan(text: ':'),
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
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                '00000',
                style: TextStyle(color: Colors.white),
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
                    onTap: () {},
                    child: AnimatedContainer(
                      height: 36,
                      width: 116,
                      duration: const Duration(
                        milliseconds: 150,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                        color: AppColors.neutal700,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 150,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/passwordCreateScreen');
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/refresh-cw.svg'),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Expanded(
                                  child: Text(
                                    'Не получил код',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12, color: AppColors.gray100),
                      children: [
                        TextSpan(text: 'Попробовать снова через '),
                        WidgetSpan(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        TextSpan(
                            text: '24 секунды',
                            style: TextStyle(color: AppColors.orange300)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
