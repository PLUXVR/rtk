import 'package:flutter/material.dart';
import 'package:flutter_rtk/src/app/colors/colors.dart';

void main() {
  runApp(const DropdownMenuWidget());
}

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({super.key});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  final TextEditingController questionController = TextEditingController();
  String? selectedQuestion;

  List<String> questionsList = [
    'Как зовут вашего любимого питомца',
    'Место рождения',
    'Последние четыре цифры номера вашей карты',
    'Имя первого учителя',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Expanded(
        child: DropdownMenu<String>(
          // width: 300,
          controller: questionController,
          enableFilter: true,
          // requestFocusOnTap: true,
          // leadingIcon: const Icon(Icons.search),
          // label: const Text('Контрольный вопрос'),
          hintText: 'Контрольный вопрос',
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0),
          ),

          dropdownMenuEntries: questionsList.map<DropdownMenuEntry<String>>(
            (String question) {
              return DropdownMenuEntry<String>(
                value: question,
                label: question,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
