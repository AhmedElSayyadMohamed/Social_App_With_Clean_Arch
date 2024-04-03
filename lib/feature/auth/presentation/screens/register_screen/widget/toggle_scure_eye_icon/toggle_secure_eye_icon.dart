import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/register_bloc/register_bloc.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

import '../../../../../../../utils/service_locator/service_locator.dart';

class RegisterToggleEyeIcon extends StatelessWidget{
  const RegisterToggleEyeIcon({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RegisterBloc,RegisterStates>(
      builder: (BuildContext context, RegisterStates state) {
        var bloc = RegisterBloc.get(context);
        return IconButton(
          padding: const EdgeInsets.all(AppPadding.p8),
          onPressed: ()=> sl<RegisterBloc>().add(TogglePasswordSecurityEyeEvent()),
          icon: bloc.isSecure
              ? const Icon(
            Icons.visibility,
            color: Colors.grey,
          )
              : const Icon(
            Icons.visibility_off,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}