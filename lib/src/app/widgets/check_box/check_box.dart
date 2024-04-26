import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_svg/svg.dart';

// Кастомный чекбокс без возможности нажатия (можно добавить при надобности)

class DefaultCheckBox extends StatelessWidget {
  final bool isError;
  final bool isValid;
  final Color? checkBoxBorderColor;
  final double? checkBoxHeight;
  final double? checkBoxWidth;
  final String? checkBoxText;

  const DefaultCheckBox({
    super.key,
    required this.isError,
    required this.isValid,
    this.checkBoxBorderColor,
    this.checkBoxHeight,
    this.checkBoxWidth,
    this.checkBoxText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          // onTap: () {},
          child: AnimatedContainer(
              height: checkBoxHeight ?? 24,
              width: checkBoxWidth ?? 24,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                  color: isError ? AppColors.red500 : AppColors.green700,
                  border: Border.all(
                      width: 2.5,
                      color: isError ? AppColors.red500 : AppColors.green700),
                  borderRadius: BorderRadius.circular(Checkbox.width)),
              child: isError
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        'assets/icons/alert-cross.svg',
                        colorFilter: ColorFilter.mode(
                            bodyBackgroundColor, BlendMode.srcIn),
                      ),
                    )
                  : isValid
                      ? Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SvgPicture.asset('assets/icons/done.svg'),
                        )
                      : null),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: Column(
            children: [
              Text(
                checkBoxText ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
