import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/components/div_text_div_widget.dart.dart';
import 'package:flutter_rtk/src/app/modules/first_screen/first_screen.dart';
import 'package:flutter_rtk/src/app/modules/registration_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Flutter RTK',
        home: FirstScreen(),
      );
}
