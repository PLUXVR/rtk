import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Flutter RTK',
        home: RegistrationScreen(),
      );
}
