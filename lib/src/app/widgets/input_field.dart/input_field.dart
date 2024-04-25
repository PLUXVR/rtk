import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Поле ввода информации

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autoValidate;
  final bool? obcureText;
  final Color? inputBackgroundColor;
  final Widget? icon;
  final String? labelText;
  final Color? textColor;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;

  const InputField({
    super.key,
    this.controller,
    this.autoValidate,
    this.obcureText,
    this.inputBackgroundColor,
    this.icon,
    this.suffixIcon,
    this.labelText,
    this.textColor,
    this.hintText,
    this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 54,
      decoration: BoxDecoration(
        color: inputBackgroundColor ?? const Color.fromARGB(255, 36, 37, 43),
        borderRadius: const BorderRadius.only(
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: icon ??
                  SvgPicture.asset(
                    'assets/icons/at-sign.svg',
                    width: 32,
                    height: 32,
                  ),
            ),
            labelStyle: TextStyle(
              color: textColor ?? const Color.fromRGBO(239, 239, 239, 1),
              fontSize: 16,
            ),
            labelText: labelText ?? '???',
            suffixIcon: suffixIcon),
        validator: validator,
      ),
    );
  }
}
