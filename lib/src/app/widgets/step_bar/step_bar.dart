import 'package:flutter/material.dart';

class StepBar extends StatelessWidget {
  const StepBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(36, 38, 45, 1)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF34363F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 32,
                  height: 4,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  width: 16,
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF34363F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 32,
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF34363F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 32,
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF34363F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 32,
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF34363F),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 32,
                  height: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
