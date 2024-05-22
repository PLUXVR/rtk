import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class TextInfoWidget extends StatelessWidget {
  final String headingText;
  final Widget bodyText;

  const TextInfoWidget({
    super.key,
    this.headingText = "",
    this.bodyText = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  headingText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: AppColors.textPrimaryEnabled,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: bodyText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
