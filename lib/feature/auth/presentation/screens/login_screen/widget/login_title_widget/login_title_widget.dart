
import 'package:flutter/material.dart';

import '../../../../../../../utils/strings_manager/strings_manager.dart';

class LoginTitleWidget extends StatelessWidget{
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.signInTo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          StringsManager.appTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color:Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}