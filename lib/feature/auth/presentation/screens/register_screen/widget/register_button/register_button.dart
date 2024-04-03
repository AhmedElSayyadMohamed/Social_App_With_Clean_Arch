import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/register_bloc/register_bloc.dart';

import '../../../../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../../../../utils/app_border/app_border.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';

class RegisterButton extends StatelessWidget {
  final void Function() onTap;
  const RegisterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (BuildContext context, RegisterStates state) {
        if (state is RegisterLoadingState) {
          return CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        }
        else {
          return CustomButton(
            onTap: onTap,
            buttonLabel: StringsManager.signUp,
            borderRadius: AppBorder.b20,
          );
        }
      },
    );
  }
}
