import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/step_one_phone_number/phone_number_widget.dart';
import 'package:flutter_rtk/src/app/modules/step_two_verification/step_two_verification_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Flutter RTK',
        home: VerificationWidget(),
      );
}
