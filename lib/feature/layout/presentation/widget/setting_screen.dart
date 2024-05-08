import 'package:flutter/material.dart';

import '../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../core/router/routing_name.dart';
import '../../../profile/presentation/business_logic/profile_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.red,
          child: CustomTextButton(
            onTap: () async {
              ProfileBloc.get(context).add(LogOutEvent());
              Navigator.pushReplacementNamed(
                context,
                Routes.loginRoute,
              );
            },
            buttonLabel: 'logout',
          ),
        ),
      ],
    );
  }
}
