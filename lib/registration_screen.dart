import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rtk/colors/colors.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureConfirmText = true;
  // Чек боксы после для надежности пароля
  bool _minSymbols = false;
  bool _lowerAndUpperCase = false;
  bool _personalInfoInPass = false;
  Color _minSymbolsCheckBoxTextColor = textColor;
  Color _lowerAndUpperCaseCheckBoxTextColor = textColor;
  Color _personalInfoTextColor = textColor;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleObscureConfirmText() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  void _checkPassword(String password) {
    setState(() {
      _minSymbols = password.contains(RegExp(r'[A-Z]'));
      _lowerAndUpperCase = password.contains(RegExp(r'[0-9]'));
      _personalInfoInPass =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/arrow-left.svg'),
            const Spacer(),
            Text(
              'Регистрация',
              style: TextStyle(color: textColor),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/help-circle.svg'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    labelText: 'ФИО',
                    // hintText: 'Enter your full name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                      // return SizedBox(
                      //   width: 50,
                      //   height: 50,
                      // );
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/smartphone.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    labelText: 'Номер телефона',
                    // hintText: 'Enter your phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/at-sign.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    labelText: 'E-mail',
                    // hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    labelText: 'Пароль',
                    // hintText: 'Enter your password',
                    suffixIcon: GestureDetector(
                      onTap: _toggleObscureText,
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    _checkPassword(value);
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: inputBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmText,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    labelText: 'Повторите пароль',
                    // hintText: 'Enter your password again',
                    suffixIcon: GestureDetector(
                      onTap: _toggleObscureConfirmText,
                      child: Icon(
                        _obscureConfirmText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
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
