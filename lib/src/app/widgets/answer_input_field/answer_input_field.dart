import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

// Поле ввода информации

class AnswerInputField extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autoValidate;
  final bool? obcureText;
  final Color? inputBackgroundColor;
  final String? labelText;
  final Color? textColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;

  const AnswerInputField({
    super.key,
    this.controller,
    this.autoValidate,
    this.obcureText,
    this.inputBackgroundColor,
    this.labelText,
    this.textColor,
    this.hintText,
    this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
        // border: Border.all(width: 10, color: Colors.red,),
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
          contentPadding: const EdgeInsets.only(
            left: 15,
          ),
          labelStyle: TextStyle(
            color: textColor ?? AppColors.gray100,
            fontSize: 16,
          ),
          labelText: labelText ?? '???',
        ),
        validator: validator,
      ),
    );
  }
}
