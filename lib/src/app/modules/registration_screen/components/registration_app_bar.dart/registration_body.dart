// TODO сделать тело регистрационного поля
import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';

class RegistrationBody extends StatelessWidget {
  final Key formKey;
  final InputField fio;
  final InputField phoneNumber;
  final InputField email;
  final InputField password;
  final InputField passwordRepeat;

  const RegistrationBody({
    super.key,
    required this.formKey,
    required this.fio,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.passwordRepeat,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20.0),
                fio,
                const SizedBox(height: 24.0),
                phoneNumber,
                const SizedBox(height: 24.0),
                email,
                const SizedBox(height: 24.0),
                password,
                const SizedBox(height: 24.0),
                passwordRepeat,
                const SizedBox(height: 24.0),
              ]),
        ),
      );
}
