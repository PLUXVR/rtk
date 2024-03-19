// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class Input extends StatelessWidget {
//   const Input({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0xFF24252B),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//         ),
//         // border: Border(
//         //   bottom: BorderSide(width: 1, color: Color(0xFF404142)),
//         // ),
//       ),
//       child: TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SvgPicture.asset(
//               'assets/icons/user.svg',
//               width: 32,
//               height: 32,
//             ),
//           ),
//           labelStyle:
//               TextStyle(color: Color.fromRGBO(239, 239, 239, 1)),
//           labelText: 'ФИО',
//           // hintText: 'Enter your full name',
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your full name';
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
