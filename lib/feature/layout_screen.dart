import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Center(
            child: CustomTextButton(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              buttonLabel: 'logout',
            )),
      ),
    );
  }
}
