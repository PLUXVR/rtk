import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? title;
  final String? description;

  const AlertDialogWidget({
    super.key,
    this.description,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      surfaceTintColor: AppColors.gray900,
      // shadowColor: AppColors.blue900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? 'Код не пришел?',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    // height: 18,
                  ),
                ),
                DefaultRectangleButton(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/icons/x-circle.svg',
                    colorFilter: const ColorFilter.mode(
                        AppColors.gray50, BlendMode.srcIn),
                  ),
                  onTap: () {
                    Navigator.of(context).maybePop();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 300,
              child: Text(
                textAlign: TextAlign.start,
                description ??
                    'Если вы не получили код, пожалуйста, выберите один из предложенных вариантов для решения проблемы.',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  // height: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
