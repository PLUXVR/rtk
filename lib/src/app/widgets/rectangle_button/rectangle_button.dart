import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Обычная квадратная кнопка без фона

class DefaultRectangleButton extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double height;
  final double width;
  final AlignmentGeometry? alignment;
  final VoidCallback? onTap;

  const DefaultRectangleButton({
    super.key,
    this.child,
    this.color,
    this.height = 32,
    this.width = 32,
    this.alignment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: AnimatedContainer(
            height: height,
            width: width,
            duration: const Duration(
              milliseconds: 150,
            ),
            decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              shape: BoxShape.rectangle,
            ),
            alignment: alignment ?? Alignment.bottomRight,
            child: child ??
                SvgPicture.asset(
                  'assets/icons/x-circle.svg',
                  colorFilter: const ColorFilter.mode(
                      Colors.transparent, BlendMode.srcIn),
                ),
          ),
        ),
      );
}
