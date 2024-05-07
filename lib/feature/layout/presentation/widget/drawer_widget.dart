import 'package:flutter/material.dart';

import '../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../core/router/routing_name.dart';
import '../../../profile/presentation/business_logic/profile_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
          Container(
            color: Colors.redAccent,
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
          )
        ],
      ),
    );
  }
}
