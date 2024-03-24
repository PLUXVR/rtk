import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_svg/svg.dart';

class InputField extends StatelessWidget {
  final Color? inputBackgroundColor;
  final Widget? child;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;

  //TODO Доделать конструктор
  const InputField({
    super.key,
    this.inputBackgroundColor,
    this.child,
    this.labelText,
    this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: inputBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: child ??
                SvgPicture.asset(
                  'assets/icons/at-sign.svg',
                  width: 32,
                  height: 32,
                ),
          ),
          labelStyle: TextStyle(color: textColor),
          labelText: labelText ?? '???',
          // hintText: hintText ?? '??',
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter';
              }
              return null;
            },
      ),
    );
  }
}


// (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your email';
//           }
//           if (!value.contains('@')) {
//             return 'Please enter a valid email address';
//           }
//           return null;
//         },