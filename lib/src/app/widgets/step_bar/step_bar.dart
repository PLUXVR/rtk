import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class StepBar extends StatelessWidget {
  final int currentStep;
  final int stepsCount;

  const StepBar({
    super.key,
    required this.currentStep,
    required this.stepsCount,
  }) : assert(currentStep > 0 && currentStep <= stepsCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(36, 38, 45, 1)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= stepsCount; i++)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF34363F),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        height: 4,
                      ),
                      if (i <= currentStep)
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.orange300,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                height: 4,
                              ),
                            ),
                            if (i == currentStep) const Spacer(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
