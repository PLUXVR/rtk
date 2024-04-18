import 'package:flutter/material.dart';

class DivTextDiv extends StatelessWidget {
  const DivTextDiv({super.key});

  @override
  Widget build(Object context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(30, 31, 36, 1)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
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
              Text(
                "или",
                style: TextStyle(color: Color(0xFFB7C2D1)),
              ),
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
      ),
    );
  }
}
