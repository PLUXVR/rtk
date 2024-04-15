import 'package:flutter/cupertino.dart';
import 'package:flutter_rtk/src/app/widgets/app_bar/default_app_bar.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';
import 'package:flutter_svg/svg.dart';

// AppBar для экрана регистрации

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({super.key});

  @override
  Widget build(BuildContext context) => DefaultAppBar(
        titleText: "Регистрация",
        // Кнопки в AppBar (Правый верхний угол)
        actions: [
          DefaultRectangleButton(
            child: SvgPicture.asset('assets/icons/help-circle.svg'),
            onTap: () {
              print('Question Button');
            },
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
