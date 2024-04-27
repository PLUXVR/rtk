import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_rtk/src/app/widgets/step_bar/step_bar.dart';
import 'package:flutter_rtk/src/app/widgets/text_info_widget/text_info_widget.dart';
import 'package:flutter_svg/svg.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _formKey = GlobalKey<FormState>();
  // Проверка на соответствие паролей

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: DefaultAppBar(
        additionHeight: 20,
        titleText: "Шаг 4 из 5",
        bottomAppBarChild: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.0),
          child: StepBar(
            currentStep: 4,
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
            headingText: "Заполните свои личные данные",
            bodyText: Text(
              'Поделитесь более подробной информацией о себе, чтобы мы могли адаптировать ваш опыт.',
              // textAlign: MainAxisAlignment(),
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      labelText: 'Имя',
                      icon: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 32,
                        height: 32,
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите имя';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      labelText: 'Фамилия',
                      icon: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 32,
                        height: 32,
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите фамилию';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      icon: SvgPicture.asset(
                        'assets/icons/at-sign.svg',
                        width: 32,
                        height: 32,
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите email';
                        }
                        if (!value.contains('@')) {
                          return 'Пожалуйста введите корректный email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
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
              print('Кнопка создать пароль нажата');
              // dispose();
              // if (_formKey.currentState!.validate()) {
              //   // Процесс регистрации
              // }
              // previousStep();
              Navigator.of(context).pushNamed('/pinCodeScreen');
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