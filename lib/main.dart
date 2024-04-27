import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/registration_module/registration_module_import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter RTK',
        routes: {
          '/': (context) => const FirstScreen(),
          '/phoneNumberScreen': (context) => const PhoneNumberScreen(),
          // '/verificationScreen': (context) => VerificationScreen(),
          '/passwordCreateScreen': (context) => const PasswordCreateScreen(),
          '/personalDataScreen': (context) => const PersonalDataScreen(),
          '/pinCodeScreen': (context) => const PinCodeScreen(),
        },
        // home: RegistrationScreen(),
      );
}
