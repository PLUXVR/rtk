// TODO сделать чекбокс отдельным элементом, скорее всего кастомным

import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class DefaultCheckBox extends StatefulWidget {
  final bool isChecked;
  final Widget? checkBoxIcon;
  final Color? checkBoxTextColor;
  final Color? checkBoxBorderColor;
  final double? checkBoxHeight;
  final double? checkBoxWidth;

  const DefaultCheckBox({
    super.key,
    required this.isChecked,
    this.checkBoxIcon,
    this.checkBoxTextColor,
    this.checkBoxBorderColor,
    this.checkBoxHeight,
    this.checkBoxWidth,
  });

  @override
  State<StatefulWidget> createState() => _DefaultCheckBoxState();
}

class _DefaultCheckBoxState extends State<DefaultCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Надежность пароля',
            style: TextStyle(
              fontSize: 13,
              color: textColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            // onTap: () {},
            child: AnimatedContainer(
                height: widget.checkBoxHeight ?? 24,
                width: widget.checkBoxWidth ?? 24,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                    color: widget.checkBoxTextColor ?? bodyBackgroundColor,
                    border: Border.all(
                        width: 1.5,
                        color: widget.checkBoxBorderColor ?? checkBoxTextColor),
                    borderRadius: BorderRadius.circular(Checkbox.width)),
                child: widget.isChecked ? widget.checkBoxIcon : null),
          ),
        ],
      ),
    );
  }
}
