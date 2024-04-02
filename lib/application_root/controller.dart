// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:social_app/core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
// import '../feature/auth/presentation/screens/login_screen/login_screen.dart';
//
// class Controller extends StatelessWidget {
//   const Controller({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     if (FirebaseAuth.instance.currentUser != null) {
//       return Scaffold(
//         body: Container(
//           color: Colors.lightBlue,
//           child: Center(
//               child: CustomTextButton(
//             onTap: ()
//             async {
//               await FirebaseAuth.instance.signOut();
//               },
//             buttonLabel: 'logout',
//           )),
//         ),
//       );
//     } else {
//       return LoginScreen();
//     }
//   }
// }
