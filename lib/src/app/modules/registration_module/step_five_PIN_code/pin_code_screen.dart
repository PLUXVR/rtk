import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_rtk/src/app/widgets/step_bar/step_bar.dart';
import 'package:flutter_rtk/src/app/widgets/text_info_widget/text_info_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';

class PinCodeScreen extends StatefulWidget {
  // final int stepsCount;
  const PinCodeScreen({
    super.key,
    // required this.stepsCount,
  });

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: DefaultAppBar(
        additionHeight: 20,
        titleText: "Шаг 5 из 5",
        bottomAppBarChild: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0),
          child: StepBar(
            currentStep: 5,
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
          const TextInfoWidget(
            headingText: "Придумайте ПИН-код",
            bodyText: Text(
              'В дальнейшем для входа в систему ПИН-код \nбудет обязательным.',
              style:
                  TextStyle(color: AppColors.white, fontSize: 12, height: 1.5),
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
                  length: 4,
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
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12, color: AppColors.gray100),
                      children: [
                        TextSpan(
                          text: 'ПРИМЕЧАНИЕ: ',
                          style: TextStyle(color: AppColors.orange300),
                        ),
                        TextSpan(
                            text:
                                'ПИН-код не может быть в простом/обратном порядке (например, 123456, 987654) и одно и то же число не может повторяться более 2 раз.',
                            style:
                                TextStyle(color: AppColors.white, height: 1.5)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 20, bottom: 35, left: 32, right: 32),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2026),
          border: Border(
            top: BorderSide(width: 1, color: Color(0xFF24252B)),
          ),
        ),
        child: SizedBox(
          height: 54,
          child: ElevatedButton(
            style: ButtonStyle(
                shadowColor: const MaterialStatePropertyAll(Colors.black),
                elevation: const MaterialStatePropertyAll(2),
                backgroundColor:
                    MaterialStateProperty.all(buttonNextColorActive),
                // : MaterialStateProperty.all(AppColors.purple800),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
            onPressed: () {
              print('Кнопка продолжить нажата');
              // dispose();
              // if (_formKey.currentState!.validate()) {
              //   // Процесс регистрации
              // }
              // previousStep();
              // Navigator.of(context).pushNamed('/pinCodeScreen');
            },
            // : null,
            child: Text(
              'Продолжить',
              style: TextStyle(
                color: textColor,
                //     : AppColors.disabledTextColor,
                // fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
