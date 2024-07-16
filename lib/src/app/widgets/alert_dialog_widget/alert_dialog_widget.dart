import 'package:flutter/material.dart';
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
      surfaceTintColor: AppColors.neutral900,
      // shadowColor: AppColors.blue900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            // decoration: BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    title ?? 'Код не пришел?',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      // height: 18,
                    ),
                  ),
                ),
                DefaultRectangleButton(
                  padding: EdgeInsets.only(right: 16, bottom: 10),
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
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
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ButtonStyle(
                    shadowColor: const MaterialStatePropertyAll(Colors.black),
                    elevation: const MaterialStatePropertyAll(2),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.neutral700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                onPressed: () {},
                child: const Text(
                  'Отправить заново',
                  style: TextStyle(
                    color: AppColors.gray50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ButtonStyle(
                    shadowColor: const MaterialStatePropertyAll(Colors.black),
                    elevation: const MaterialStatePropertyAll(2),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.neutral700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                onPressed: () {},
                child: const Text(
                  'Служба поддержки',
                  style: TextStyle(
                    color: AppColors.gray50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
