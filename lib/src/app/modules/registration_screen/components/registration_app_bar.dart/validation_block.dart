import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

class ValidationBlock extends StatelessWidget {
  final bool isAllValid;

  const ValidationBlock({
    super.key,
    this.isAllValid = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: isAllValid
                  ? Text(
                      'надежный',
                      style: TextStyle(
                        fontSize: 13,
                        color: doneTextColor,
                      ),
                    )
                  : null,
            ),
          ),
          const Row(
            children: [
              SizedBox(height: 16.0),
              Text('Надежность пароля:',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(239, 239, 239, 1),
                  )),
            ],
          ),
          const SizedBox(height: 16.0),
          //TODO Вставить чекбоксы и сделать отдельный виджет для отображения
        ],
      ),
    );
  }
}
