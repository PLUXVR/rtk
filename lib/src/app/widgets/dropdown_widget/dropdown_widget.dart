import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DropdownMenuWidget extends StatefulWidget {
  final List<String>? questionList;

  const DropdownMenuWidget({super.key, required this.questionList});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  String selectedQuestion = 'Выберите контрольный вопрос';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
        color: AppColors.gray700,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.neutal100,
            width: 1.0,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset("assets/icons/vector.svg"),
          ),
          dropdownColor: AppColors.neutal800,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AutoSizeText(
              maxLines: 1,
              selectedQuestion,
              style: const TextStyle(color: AppColors.textPrimaryEnabled),
            ),
          ),
          isExpanded: true,
          iconSize: 30.0,
          style: const TextStyle(color: AppColors.textPrimaryEnabled),
          items: widget.questionList!.map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                selectedQuestion = val!;
              },
            );
          },
        ),
      ),
    );
  }
}
