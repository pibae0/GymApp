// import 'package:flutter/material.dart';

// import 'package:gym_project/utils/app_style.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => const HomeScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         backgroundColor: AppTheme.medium,
//         body: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.ac_unit,
//                 color: AppTheme.accent,
//                 size: 200,
//               ),
//               Text(
//                 'Gym SportApp',
//                 style: AppTheme.splashStyle,
//               )
//             ],
//           ),
//         ));
//   }
// }
