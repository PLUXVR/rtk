import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final Color backgroundColor;
  final Widget? leading;
  final VoidCallback? onLeadingTap;
  final List<Widget> actions;
  final Widget? icon;
  final bool centerTitle;

  const DefaultAppBar({
    super.key,
    this.titleText,
    this.title,
    this.backgroundColor = const Color.fromRGBO(36, 38, 45, 1),
    this.leading,
    this.onLeadingTap,
    this.actions = const [],
    this.icon,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        titleSpacing: 0,
        title: titleText is String
            ? Text(
                titleText!,
                style: TextStyle(
                  color: Color.fromRGBO(239, 239, 239, 1),
                  fontSize: 24,
                ),
              )
            : title,
        backgroundColor: backgroundColor,
        leadingWidth: 78,
        centerTitle: centerTitle,
        leading: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            leading ??
                DefaultRectangleButton(
                    onTap: onLeadingTap ??
                        () {
                          print('Exit Button');
                        }
                    // Navigator.of(context).maybePop,
                    ),
          ],
        ),
        actions: actions,

        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SvgPicture.asset('assets/icons/arrow-lef222222222t.svg'),
        //     const Spacer(),
        //     Text(
        //       'Регистрация',
        //       style: TextStyle(color: textColor),
        //     ),
        //     const Spacer(),
        //     SvgPicture.asset('assets/icons/help-circle.svg'),
        //   ],
        // ),
      );
  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
