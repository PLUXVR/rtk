import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatefulWidget {
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
      _minSymbols = password.contains(new RegExp(r'[A-Z]'));
      _lowerAndUpperCase = password.contains(new RegExp(r'[0-9]'));
      _personalInfoInPass =
          password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 31, 36, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 38, 45, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/arrow-left.svg'),
            Spacer(),
            Text(
              'Регистрация',
              style: TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
            ),
            Spacer(),
            Icon(
              Icons.question_mark_rounded,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  labelText: 'ФИО',
                  // hintText: 'Enter your full name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
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
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmText,
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  labelText: 'Повторите пароль',
                  hintText: 'Enter your password again',
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
              SizedBox(height: 16.0),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: _minSymbols,
                        onChanged: (value) {
                          setState(() {
                            _minSymbols = value!;
                          });
                        },
                      ),
                      Text(
                        ' Минимум 8 символов',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(239, 239, 239, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: _lowerAndUpperCase,
                        onChanged: (value) {
                          setState(() {
                            _lowerAndUpperCase = value!;
                          });
                        },
                      ),
                      Text(
                        ' Пароль должен содержать буквы верхнего инижнего \n регистра',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(239, 239, 239, 1),
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: _personalInfoInPass,
                        onChanged: (value) {
                          setState(() {
                            _personalInfoInPass = value!;
                          });
                        },
                      ),
                      Text(
                        'Не рекомендуется использовать личную информацию \n(имена, даты рождения, и т.д.) в качестве пароля',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(239, 239, 239, 1),
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Color(0xFF24252B)),
                    top: BorderSide(width: 1, color: Color(0xFF24252B)),
                    right: BorderSide(color: Color(0xFF24252B)),
                    bottom: BorderSide(color: Color(0xFF24252B)),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 528,
                      height: 72,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Color(0xFF24252B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Далее',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF858586),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              // ElevatedButton(
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(
              //           Color.fromRGBO(173, 173, 174, 1))),
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       // Process registration form here
              //     }
              //   },
              //   child: Text(''),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
