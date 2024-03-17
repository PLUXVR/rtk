import 'package:flutter/material.dart';
import 'package:flutter_rtk/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter RTK',
      home: RegistrationScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const FigmaToCodeApp());
// }

// // Generated by: https://www.figma.com/community/plugin/842128343887142055/
// class FigmaToCodeApp extends StatelessWidget {
//   const FigmaToCodeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
//       ),
//       home: Scaffold(
//         body: ListView(children: [
//           FirstScreen(),
//         ]),
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 576,
//           height: 1152,
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(color: Color(0xFF1E1F24)),
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 top: 64,
//                 child: Container(
//                   width: 576,
//                   height: 1088,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         top: -64,
//                         child: Container(
//                           width: 576,
//                           height: 1148,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                   "https://via.placeholder.com/576x1148"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Positioned(
//                       //   left: 0,
//                       //   top: -64,
//                       // child: Container(
//                       //   width: 576,
//                       //   height: 1151,
//                       //   decoration: BoxDecoration(
//                       //     image: DecorationImage(
//                       //       image: NetworkImage(
//                       //           "https://via.placeholder.com/576x1151"),
//                       //       fit: BoxFit.cover,
//                       //     ),
//                       //   ),
//                       // ),
//                       // ),
//                       Positioned(
//                         left: 0,
//                         top: -63,
//                         child: Container(
//                           width: 576,
//                           height: 1150,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment(0.15, -0.99),
//                               end: Alignment(-0.15, 0.99),
//                               colors: [Color(0x4C1E1F24), Color(0xFF1E1F24)],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                   width: 576,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 165,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 24,
//                                     padding: const EdgeInsets.only(
//                                         top: 5, bottom: 3),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 20,
//                                           height: 16,
//                                           decoration: ShapeDecoration(
//                                             color: Color(0xFFEFEFEF),
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(2)),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 1),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Text(
//                                     '76%',
//                                     style: TextStyle(
//                                       color: Color(0xFFEFEFEF),
//                                       fontSize: 22,
//                                       fontFamily: 'ALS Hauss Variable',
//                                       fontWeight: FontWeight.w400,
//                                       height: 0.05,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 24,
//                                           height: 24,
//                                           child: Stack(
//                                             children: [
//                                               Positioned(
//                                                 left: 0,
//                                                 top: 0,
//                                                 child: Container(
//                                                   width: 24,
//                                                   height: 24,
//                                                   child: Stack(children: []),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 24,
//                                           height: 24,
//                                           child: Stack(children: []),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 24,
//                                           height: 24,
//                                           child: Stack(
//                                             children: [
//                                               Positioned(
//                                                 left: 2.87,
//                                                 top: 0,
//                                                 child: Container(
//                                                   width: 18.27,
//                                                   height: 24,
//                                                   child: Stack(children: []),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 147,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             height: double.infinity,
//                                             clipBehavior: Clip.antiAlias,
//                                             decoration: BoxDecoration(),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   width: 24,
//                                                   height: 24,
//                                                   child: Stack(children: []),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           width: 24,
//                                           height: 24,
//                                           child: Stack(children: []),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: Container(
//                                             height: double.infinity,
//                                             clipBehavior: Clip.antiAlias,
//                                             decoration: BoxDecoration(),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   width: 24,
//                                                   height: 24,
//                                                   child: Stack(children: []),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Container(
//                                     width: 57,
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           '21:58',
//                                           style: TextStyle(
//                                             color: Color(0xFFEFEFEF),
//                                             fontSize: 22,
//                                             fontFamily: 'ALS Hauss Variable',
//                                             fontWeight: FontWeight.w400,
//                                             height: 0.05,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 24,
//                 top: 663,
//                 child: Container(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 528,
//                         child: Text(
//                           'Добро пожаловать',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Color(0xFFFDFEFF),
//                             fontSize: 28,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w500,
//                             height: 0.05,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: 528,
//                         child: Text(
//                           'Нажмите на кнопку и начните пользоваться нашим приложением',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.8500000238418579),
//                             fontSize: 18,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w400,
//                             height: 0.07,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 24,
//                 top: 819,
//                 child: Container(
//                   height: 220,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(20),
//                         decoration: ShapeDecoration(
//                           color: Color(0xFF7941F0),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Вход',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color(0xFFEFEFEF),
//                                 fontSize: 20,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                                 height: 0.08,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       Container(
//                         width: 384,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 1,
//                                       strokeAlign: BorderSide.strokeAlignCenter,
//                                       color: Color(0xFFADADAE),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Text(
//                               'или',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color(0xFF858586),
//                                 fontSize: 20,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0.07,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Container(
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 1,
//                                       strokeAlign: BorderSide.strokeAlignCenter,
//                                       color: Color(0xFFADADAE),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 20),
//                         decoration: ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side:
//                                 BorderSide(width: 1, color: Color(0xFFADADAE)),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Регистрация',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Color(0xFFEFEFEF),
//                                 fontSize: 20,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                                 height: 0.08,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 258,
//                 top: 474,
//                 child: Container(
//                   width: 93,
//                   height: 157,
//                   child: Stack(children: []),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
