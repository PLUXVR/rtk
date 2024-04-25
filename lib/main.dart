import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/first_screen.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/registration_screen.dart';
import 'package:flutter_rtk/src/app/modules/step_one_phone_number/phone_number_screen.dart';
import 'package:flutter_rtk/src/app/modules/step_three_create_password/step_three_create_password.dart';
import 'package:flutter_rtk/src/app/modules/step_two_verification/step_two_verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Flutter RTK',
        // home: FirstScreen(),
        // home: PhoneNumberScreen(),
        // home: VerificationScreen(),
        home: PasswordCreateScreen(),
        // home: RegistrationScreen(),
      );
}
