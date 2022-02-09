// import 'package:boxicons/boxicons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:Florxy/widgets/fontWeight.dart';
// import 'package:Florxy/widgets/font.dart';
// import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
//
//
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
//
//
//
// class ExampleScreen extends StatefulWidget {
//   @override
//   _ExampleScreenState createState() => _ExampleScreenState();
// }
//
// class _ExampleScreenState extends State<ExampleScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: CustomRefreshIndicator(
//         onRefresh: () => Future.delayed(const Duration(seconds: 3)),
//         child: const ExampleList(),
//         builder: (
//             BuildContext context,
//             Widget child,
//             IndicatorController controller,
//             ) {
//           return child;
//         },
//       ),
//     );
//   }
// }
