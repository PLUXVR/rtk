import 'package:flutter/material.dart';

class DivTextDiv extends StatelessWidget {
  const DivTextDiv({super.key});

  @override
  Widget build(Object context) {
    return Container(
      decoration: ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.white,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "или",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
        ],
      ),
    );
  }
}
