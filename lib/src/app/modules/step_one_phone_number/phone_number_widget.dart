import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_rtk/src/app/widgets/step_bar/step_bar.dart';
import 'package:flutter_rtk/src/app/widgets/text_info_widget/text_info_widget.dart';
import 'package:flutter_svg/svg.dart';

class PhoneNumberScreen extends StatefulWidget {
  // final int stepsCount;
  const PhoneNumberScreen({
    super.key,
    // required this.stepsCount,
  });

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  // int _currenStep = 1;

  // nextStep() {
  //   if (_currenStep < widget.stepsCount) {
  //     setState(() {
  //       _currenStep++;
  //     });
  //   }
  // }

  // previousStep() {
  //   if (_currenStep > 1) {
  //     setState(() {
  //       _currenStep--;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: DefaultAppBar(
        additionHeight: 20,
        titleText: "Шаг 1 из 5",
        bottomAppBarChild: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0),
          child: StepBar(
            currentStep: 1,
            stepsCount: 5,
          ),
        ),
        actions: [
          DefaultRectangleButton(
            child: SvgPicture.asset('assets/icons/x-circle.svg'),
          )
        ],
      ),
      body: Column(
        children: [
          const TextInfoWidget(
            headingText: 'Введите номер телефона',
            // bodyText:
            //     'Для создания аккаунта необходимо ввести личные данные. Мы обязуемся хранить их в целости и сохранности.',
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: InputField(
                labelText: 'Номер телефона',
                keyboardType: TextInputType.phone,
                icon: SvgPicture.asset(
                  'assets/icons/smartphone.svg',
                  width: 32,
                  height: 32,
                ),
                autoValidate: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста введите номер телефона';
                  }
                  return null;
                },
              ),
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
                elevation: const MaterialStatePropertyAll(5),
                backgroundColor:
                    MaterialStateProperty.all(buttonNextColorActive),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
            onPressed: () {
              print('Кнопка далее нажата');
              // dispose();
              // if (_formKey.currentState!.validate()) {
              //   // Процесс регистрации
              // }
              // previousStep();
            },
            child: Text(
              'Отправить код',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
