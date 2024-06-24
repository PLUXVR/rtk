import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/circular_prosgress_indicator/circular_progress_indicator.dart';
import 'package:flutter_rtk/src/app/widgets/input_field.dart/input_field.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _filledPhoneNumber = false;
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray900,
      appBar: DefaultAppBar(
        actions: [
          DefaultRectangleButton(
            alignment: Alignment.center,
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: SvgPicture.asset('assets/icons/x-circle.svg'),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Вход в личный кабинет",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.gray50,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color(0xFF24252B),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFF24252B),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      controller: _phoneNumberController,
                      labelText: 'Номер телефона',
                      keyboardType: TextInputType.phone,
                      icon: SvgPicture.asset(
                        'assets/icons/smartphone.svg',
                        width: 32,
                        height: 32,
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          if (value == '' || value!.length != 11) {
                            setState(() {
                              _filledPhoneNumber = false;
                            });
                          } else {
                            setState(() {
                              _filledPhoneNumber = true;
                            });
                          }
                        });

                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите номер телефона';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _passwordController,
                      labelText: 'Пароль',
                      obcureText: true,
                      icon: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        width: 32,
                        height: 32,
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                      ),
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста введите пароль';
                        }
                        if (value.length < 8) {
                          return 'Пароль должен быть больше 8 символов';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 20, bottom: 35, left: 32, right: 32),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2026),
          border: Border(
            top: BorderSide(width: 1, color: Color(0xFF24252B)),
          ),
        ),
        child: SizedBox(
          height: 54,
          child: ElevatedButton(
            style: ButtonStyle(
                shadowColor: const MaterialStatePropertyAll(Colors.black),
                elevation: const MaterialStatePropertyAll(2),
                backgroundColor: MaterialStateProperty.all(AppColors.purple500),
                // : MaterialStateProperty.all(AppColors.purple800),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
            onPressed: () {
              print('Кнопка продолжить нажата');
              // dispose();
              // if (_formKey.currentState!.validate()) {
              //   // Процесс регистрации
              // }
              // previousStep();
              // Navigator.of(context).pushNamed('/pinCodeScreen');

              showDialog(
                context: context,
                builder: ((context) => const ProgressIndicatorWidget()),
              );
            },
            // : null,
            child: const Text(
              'Продолжить',
              style: TextStyle(
                color: AppColors.gray50,
                //     : AppColors.disabledTextColor,
                // fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
