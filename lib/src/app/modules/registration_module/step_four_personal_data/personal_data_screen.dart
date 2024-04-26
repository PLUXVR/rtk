import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/modules/registration_module/registration_screen/components/registration_app_bar.dart/validation_widget.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/check_box/check_box.dart';
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
  // Для сохранения значения поля ввода паролей
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  // Проверка на соответствие паролей
  bool _passMatch = true;
  // Чек боксы для надежности пароля
  bool _minSymbolsError = true;
  bool _lowerAndUpperCaseError = true;
  bool _personalInfoInPassError = true;
  bool _minSymbolsValid = false;
  bool _lowerAndUpperCaseValid = false;
  bool _personalInfoInPassValid = false;

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
        actions: [
          DefaultRectangleButton(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: SvgPicture.asset('assets/icons/x-circle.svg'),
          ),
        ],
      ),
      body: Column(
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
                      controller: _passwordController,
                      labelText: 'Пароль',
                      obcureText: true,
                      icon: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        width: 32,
                        height: 32,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: _passMatch
                            ? null
                            : SvgPicture.asset(
                                'assets/icons/alert-circle.svg',
                              ),
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        //   if (value!.length <= 8) {
                        //     setState(() {
                        //       _minSymbolsError = true;
                        //       _minSymbolsValid = false;
                        //     });
                        //   }
                        // });
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите пароль';
                        }
                        if (value.length < 8) {
                          return 'Пароль должен быть больше 8 символов';
                        }
                        if (_confirmPasswordController.text.isNotEmpty &&
                            value != _confirmPasswordController.text) {
                          _passMatch = false;

                          return 'Пароли не совпадают';
                        } else {
                          _passMatch = true;
                        }
                        // _checkPassword(value);
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _confirmPasswordController,
                      labelText: 'Повторите пароль',
                      obcureText: true,
                      icon: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        width: 32,
                        height: 32,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: _passMatch
                            ? null
                            : SvgPicture.asset(
                                'assets/icons/alert-circle.svg',
                              ),
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _passMatch = false;
                          return 'Пожалуйста подтвердите пароль';
                        }
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          if (value.contains(RegExp(r'[0-9]'))) {
                            setState(() {
                              _personalInfoInPassError = false;
                              _personalInfoInPassValid = true;
                            });
                          } else {
                            setState(() {
                              _personalInfoInPassError = true;
                              _personalInfoInPassValid = false;
                            });
                          }
                        });
                        // Проверка пароля на отсутствие значения
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          if (value.length >= 8) {
                            setState(() {
                              _minSymbolsError = false;
                              _minSymbolsValid = true;
                            });
                          } else {
                            setState(() {
                              _minSymbolsError = true;
                              _minSymbolsValid = false;
                            });
                          }
                        });
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          if ((value.contains(RegExp(r'[А-Я]')) ||
                                  value.contains(RegExp(r'[A-Z]'))) &&
                              (value.contains(RegExp(r'[a-z]')) ||
                                  value.contains(RegExp(r'[а-я]')))) {
                            setState(() {
                              _lowerAndUpperCaseError = false;
                              _lowerAndUpperCaseValid = true;
                            });
                          } else {
                            setState(() {
                              _lowerAndUpperCaseError = true;
                              _lowerAndUpperCaseValid = false;
                            });
                          }
                        });

                        // Проверка пароля на соответствие паролей
                        if (value != _passwordController.text) {
                          _passMatch = false;

                          return 'Пароли не совпадают';
                        } else {
                          _passMatch = true;
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
          //  Поля валидации пароля
          ValidationPasswordWidget(
            isAllValid: _minSymbolsValid &&
                    _lowerAndUpperCaseValid &&
                    _personalInfoInPassValid
                ? true
                : false,
            minSymbolsCheckBox: DefaultCheckBox(
              isError: _minSymbolsError,
              isValid: _minSymbolsValid,
              checkBoxText: 'Не менее 8 символов',
            ),
            lowerAndUpperCaseCheckBox: DefaultCheckBox(
              isError: _lowerAndUpperCaseError,
              isValid: _lowerAndUpperCaseValid,
              checkBoxText: 'Сочетание символов верхнего и нижнего регистра',
            ),
            personalInfoInPassCheckBox: DefaultCheckBox(
              isError: _personalInfoInPassError,
              isValid: _personalInfoInPassValid,
              checkBoxText: 'По крайней мере, одно число',
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
                backgroundColor: _minSymbolsValid &&
                        _lowerAndUpperCaseValid &&
                        _personalInfoInPassValid &&
                        _passMatch
                    ? MaterialStateProperty.all(buttonNextColorActive)
                    : MaterialStateProperty.all(AppColors.purple800),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
            onPressed: _minSymbolsValid &&
                    _lowerAndUpperCaseValid &&
                    _personalInfoInPassValid &&
                    _passMatch
                ? () {
                    print('Кнопка далее нажата');
                    // dispose();
                    // if (_formKey.currentState!.validate()) {
                    //   // Процесс регистрации
                    // }
                    // previousStep();
                  }
                : null,
            child: Text(
              'Создать пароль',
              style: TextStyle(
                  color: _minSymbolsValid &&
                          _lowerAndUpperCaseValid &&
                          _personalInfoInPassValid &&
                          _passMatch
                      ? textColor
                      : AppColors.disabledTextColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
