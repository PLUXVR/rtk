import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/components/registration_app_bar.dart/validation_block.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/registration_screen.dart';
import 'package:flutter_rtk/src/app/widgets/check_box/check_box.dart';

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
