import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/modules/registration_module/registration_screen/components/registration_app_bar.dart/registration_app_bar.dart';
import 'package:flutter_rtk/src/app/modules/registration_module/registration_screen/components/registration_app_bar.dart/registration_body.dart';
import 'package:flutter_rtk/src/app/modules/registration_module/registration_screen/components/registration_app_bar.dart/validation_widget.dart';
import 'package:flutter_rtk/src/app/widgets/check_box/check_box.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';
import 'package:flutter_svg/svg.dart';

// Страница регистрации пользователя

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  // Для сохранения значения поля ввода паролей
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  // Проверка на соответствие паролей
  bool _passMatch = true;
  // Чек боксы для надежности пароля
  bool _minSymbolsError = false;
  bool _lowerAndUpperCaseError = false;
  bool _personalInfoInPassError = false;
  bool _minSymbolsValid = false;
  bool _lowerAndUpperCaseValid = false;
  bool _personalInfoInPassValid = true;
  // bool _isAllValid = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   _isAllValid =
  //       _minSymbolsValid && _lowerAndUpperCaseValid && _personalInfoInPassValid;
  //   super.initState();
  // }
  // void _checkPassword(String password) {
  //   setState(() {
  //     _minSymbols = password.contains(RegExp(r'[A-Z]'));
  //     _lowerAndUpperCase = password.contains(RegExp(r'[0-9]'));
  //     _personalInfoInPass =
  //         password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: const RegistrationAppBar(),
      body: ListView(
        children: [
          RegistrationBody(
            formKey: _formKey,
            // ФИО
            fio: InputField(
              labelText: 'ФИО',
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                width: 32,
                height: 32,
              ),
              autoValidate: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста введите ФИО';
                }
                return null;
              },
            ),
            // Номер телефона
            phoneNumber: InputField(
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
            // Электронная почта
            email: InputField(
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
            // Поле ввода пароля
            password: InputField(
              controller: _passwordController,
              labelText: 'Пароль',
              obcureText: true,
              icon: SvgPicture.asset(
                'assets/icons/lock.svg',
                width: 32,
                height: 32,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
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
            passwordRepeat: InputField(
              controller: _confirmPasswordController,
              labelText: 'Повторите пароль',
              obcureText: true,
              icon: SvgPicture.asset(
                'assets/icons/lock.svg',
                width: 32,
                height: 32,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
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
                // Проверка пароля на отсутствие значения
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
          ),
          // Поля валидации пароля
          ValidationPasswordWidget(
            isAllValid: _minSymbolsValid &&
                    _lowerAndUpperCaseValid &&
                    _personalInfoInPassValid
                ? true
                : false,
            minSymbolsCheckBox: DefaultCheckBox(
              isError: _minSymbolsError,
              isValid: _minSymbolsValid,
              checkBoxText: 'Минимум 8 символов',
            ),
            lowerAndUpperCaseCheckBox: DefaultCheckBox(
              isError: _lowerAndUpperCaseError,
              isValid: _lowerAndUpperCaseValid,
              checkBoxText:
                  'Пароль должен содержать буквы верхнего и нижнего регистра',
            ),
            personalInfoInPassCheckBox: DefaultCheckBox(
              isError: _personalInfoInPassError,
              isValid: _personalInfoInPassValid,
              checkBoxText:
                  'Не рекомендуется использовать личную информацию (имена, даты рождения и т.д.) в качестве пароля',
            ),
          ),

          const SizedBox(height: 32.0),
        ],
      ),
      bottomNavigationBar: Container(
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
                backgroundColor: MaterialStateProperty.all(_minSymbolsValid &&
                        _lowerAndUpperCaseValid &&
                        _personalInfoInPassValid
                    ? buttonNextColorActive
                    : buttonNextColorBlocked),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ))),
            onPressed: _minSymbolsValid &&
                    _lowerAndUpperCaseValid &&
                    _personalInfoInPassValid
                ? () {
                    print('Кнопка далее нажата');
                    // dispose();
                    // if (_formKey.currentState!.validate()) {
                    //   // Процесс регистрации
                    // }
                  }
                : null,
            child: Text(
              'Далее',
              style: _minSymbolsValid &&
                      _lowerAndUpperCaseValid &&
                      _personalInfoInPassValid
                  ? TextStyle(color: textColor)
                  : TextStyle(color: textColorButtonBlocked),
            ),
          ),
        ),
      ),
    );
  }
}
