import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/widgets/rectangle_button/rectangle_button.dart';

// Дефолтный AppBar с кнопкой назад

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
                style: const TextStyle(
                  color: Color.fromRGBO(239, 239, 239, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )
            : title,
        backgroundColor: backgroundColor,
        leadingWidth: 78,
        centerTitle: centerTitle,
        leading: Row(
          children: [
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
      );
  @override
  Size get preferredSize => const Size.fromHeight(54.0);
}
