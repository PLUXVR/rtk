import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/components/registration_app_bar.dart/registration_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';
import 'package:flutter_svg/svg.dart';

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
  bool _minSymbols = false;
  bool _lowerAndUpperCase = false;
  bool _personalInfoInPass = false;
  Color _minSymbolsCheckBoxTextColor = checkBoxTextColor;
  Color _lowerAndUpperCaseCheckBoxTextColor = checkBoxTextColor;
  Color _personalInfoTextColor = checkBoxTextColor;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Скрыть текст или показать
  // bool _obscureText = true;
  // bool _obscureConfirmText = true;
  // void _toggleObscureText() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  // void _toggleObscureConfirmText() {
  //   setState(() {
  //     _obscureConfirmText = !_obscureConfirmText;
  //   });
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              // ФИО
              InputField(
                labelText: 'ФИО',
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  width: 32,
                  height: 32,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста введите ФИО';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              // Номер телефона
              InputField(
                labelText: 'Номер телефона',
                keyboardType: TextInputType.phone,
                icon: SvgPicture.asset(
                  'assets/icons/smartphone.svg',
                  width: 32,
                  height: 32,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста введите номер телефона';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              // Электронная почта
              InputField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                icon: SvgPicture.asset(
                  'assets/icons/at-sign.svg',
                  width: 32,
                  height: 32,
                ),
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

              const SizedBox(height: 24.0),

              // Поле ввода пароля

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
                  padding: const EdgeInsets.all(16.0),
                  child: _passMatch
                      ? null
                      : SvgPicture.asset(
                          'assets/icons/alert-circle.svg',
                        ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть больше 6 символов';
                  }
                  // _checkPassword(value);
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

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
                  padding: const EdgeInsets.all(16.0),
                  // Icon(
                  //   _obscureConfirmText
                  //       ? Icons.visibility_off
                  //       : Icons.visibility,
                  // ),
                  child: _passMatch
                      ? null
                      : SvgPicture.asset(
                          'assets/icons/alert-circle.svg',
                        ),
                ),
                validator: (value) {
                  // Проверка пароля на отсутствие значения
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _passMatch = false;
                    });
                    return 'Пожалуйста подтвердите пароль';
                  }
                  // Проверка пароля на соответствие паролей
                  if (value != _passwordController.text) {
                    setState(() {
                      _passMatch = false;
                    });
                    return 'Пароли не совпадают';
                  } else {
                    setState(() {
                      _passMatch = true;
                    });
                  }
                  // Проверка пароля на нужное количество символов
                  value.length >= 8
                      ? setState(() {
                          _minSymbols = true;
                        })
                      : setState(() {
                          _minSymbols = false;
                        });

                  return null;
                },
              ),

              const SizedBox(height: 24.0),
              const Text('Надежность пароля',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(239, 239, 239, 1),
                  )),
              const SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          height: 30,
                          width: 15,
                          child: Checkbox(
                            checkColor: doneTextColor,
                            activeColor: bodyBackgroundColor,
                            side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const BorderSide(
                                      color: Color.fromRGBO(239, 239, 239, 1),
                                      width: 1.5);
                                }
                                return const BorderSide(
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                    width: 1.5);
                              },
                            ),
                            shape: const CircleBorder(),
                            value: _minSymbols,
                            onChanged: (value) {
                              setState(() {
                                _minSymbols = value!;
                                if (value) {
                                  _minSymbolsCheckBoxTextColor = doneTextColor;
                                } else {
                                  _minSymbolsCheckBoxTextColor = textColor;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        ' Минимум 8 символов',
                        style: TextStyle(
                          fontSize: 13,
                          color: _minSymbolsCheckBoxTextColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 20,
                          width: 15,
                          child: Checkbox(
                            checkColor: doneTextColor,
                            activeColor: bodyBackgroundColor,
                            side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const BorderSide(
                                      color: Color.fromRGBO(239, 239, 239, 1),
                                      width: 1.5);
                                }
                                return const BorderSide(
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                    width: 1.5);
                              },
                            ),
                            shape: const CircleBorder(),
                            value: _lowerAndUpperCase,
                            onChanged: (value) {
                              setState(() {
                                _lowerAndUpperCase = value!;
                                if (value) {
                                  _lowerAndUpperCaseCheckBoxTextColor =
                                      doneTextColor;
                                } else {
                                  _lowerAndUpperCaseCheckBoxTextColor =
                                      textColor;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        ' Пароль должен содержать буквы верхнего и нижнего \n регистра',
                        style: TextStyle(
                          fontSize: 13,
                          color: _lowerAndUpperCaseCheckBoxTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 20,
                          width: 15,
                          child: Checkbox(
                            checkColor: doneTextColor,
                            activeColor: bodyBackgroundColor,
                            side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return const BorderSide(
                                      color: Color.fromRGBO(239, 239, 239, 1),
                                      width: 1.5);
                                }
                                return const BorderSide(
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                    width: 1.5);
                              },
                            ),
                            shape: const CircleBorder(),
                            value: _personalInfoInPass,
                            onChanged: (value) {
                              setState(() {
                                _personalInfoInPass = value!;
                                if (value) {
                                  _personalInfoTextColor = doneTextColor;
                                } else {
                                  _personalInfoTextColor = textColor;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        'Не рекомендуется использовать личную информацию \n(имена, даты рождения, и т.д.) в качестве пароля',
                        style: TextStyle(
                          fontSize: 13,
                          color: _personalInfoTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.symmetric(
                //   vertical: 24,
                //   horizontal: 32,
                // ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xFF24252B)),
                  ),
                ),
                child: SizedBox(
                  height: 72,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(buttonNextColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Процесс регистрации
                      }
                    },
                    child: Text(
                      'Далее',
                      style: TextStyle(color: buttonNextColorText),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
