import 'package:flutter/material.dart';

class RegistrationScreen2 extends StatefulWidget {
  @override
  _RegistrationScreen2State createState() => _RegistrationScreen2State();
}

class _RegistrationScreen2State extends State<RegistrationScreen2> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(64, 65, 66, 1),
      backgroundColor: const Color.fromARGB(36, 37, 43, 1),
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  labelText: 'Номер телефона',
                  // hintText: 'Номер телефона',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ваш номер телефона';
                  }
                  // Переделать под номер телефона
                  if (!value.contains('@')) {
                    return 'Введите корректно номер телефона';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  labelText: 'Пароль',
                  // hintText: 'Enter your password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть больше 6 симоволо в длину';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
                  labelText: 'Confirm password',
                  hintText: 'Enter your password again',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) => _confirmPassword = value!,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform registration logic here
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
