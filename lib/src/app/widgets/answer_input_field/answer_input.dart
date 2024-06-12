import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class AnswerInput extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autoValidate;
  final bool? obcureText;
  final Color? inputBackgroundColor;
  final Color? textColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;

  const AnswerInput({
    super.key,
    this.hintText,
    this.controller,
    this.autoValidate,
    this.obcureText,
    this.inputBackgroundColor,
    this.textColor,
    this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.gray700,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autoValidate,
        obscureText: obcureText ?? false,
        style: TextStyle(
          color: textColor ?? const Color.fromRGBO(239, 239, 239, 1),
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16),
          labelStyle: TextStyle(
            color: textColor ?? AppColors.gray100,
            fontSize: 16,
          ),
          labelText: 'Ответ',
        ),
        validator: validator,
      ),
    );
  }
}
