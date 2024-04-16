import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DivTextDiv extends StatelessWidget {
  const DivTextDiv({super.key});

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 21,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 0.3,
                endIndent: 16,
              ),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            Text(
              "или",
              style: TextStyle(color: Color(0xFFB7C2D1)),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 0.3,
                indent: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
