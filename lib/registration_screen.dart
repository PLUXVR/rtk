import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
      backgroundColor: Color.fromARGB(35, 173, 173, 174),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 133, 134, 1),
        title: Text('Registration'),
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
                  labelText: 'Электронная почта',
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
                  Checkbox(
                    value: _minSymbols,
                    onChanged: (value) {
                      setState(() {
                        _minSymbols = value!;
                      });
                    },
                  ),
                  Text(
                    'Минимум 8 символов',
                    style: TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  ),
                  SizedBox(width: 16.0),
                  Checkbox(
                    value: _lowerAndUpperCase,
                    onChanged: (value) {
                      setState(() {
                        _lowerAndUpperCase = value!;
                      });
                    },
                  ),
                  Text(
                    'Пароль должен содержать буквы верхнего и нижнего регистра',
                    style: TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  ),
                  SizedBox(width: 16.0),
                  Checkbox(
                    value: _personalInfoInPass,
                    onChanged: (value) {
                      setState(() {
                        _personalInfoInPass = value!;
                      });
                    },
                  ),
                  Text(
                    'Не рекомендуется использовать личную информацию (имена, даты рождения, и т.д.) в качестве пароля',
                    style: TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(173, 173, 174, 1))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process registration form here
                  }
                },
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
