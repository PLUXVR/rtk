import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Обычная квадратная кнопка без фона

class DefaultRectangleButton extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const DefaultRectangleButton({
    super.key,
    this.child,
    this.color,
    this.height = 32,
    this.width = 32,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap ?? () {},
        child: AnimatedContainer(
          height: height,
          width: width,
          duration: const Duration(
            milliseconds: 150,
          ),
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(36, 38, 45, 1),
            shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: child ?? SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
      );
}
