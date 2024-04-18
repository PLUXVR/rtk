import 'package:flutter/cupertino.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';

class StepAppBar extends StatelessWidget {
  const StepAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      titleText: "Шаг 1 из 5",
      actions: [
        DefaultRectangleButton(
          child: SvgPicture.asset('assets/icons/x-circle.svg'),
        )
      ],
    );
  }
}
