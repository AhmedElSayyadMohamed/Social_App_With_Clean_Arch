import 'package:flutter/material.dart';

import '../../../../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../../../../core/router/routing_name.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.dontHaveAnAccount,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        CustomTextButton(
          onTap: () => Navigator.pushNamed(context, Routes.signUpRoute),
          buttonLabel: StringsManager.signUp,
          textColor:Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}

