import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/login_bloc/login_states.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';

import '../../../../business_logic/login_bloc/login_bloc.dart';

class ToggleEyeIcon extends StatelessWidget{
  const ToggleEyeIcon({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc,LoginStates>(
      builder: (BuildContext context, LoginStates state) {
        var bloc = LoginBloc.get(context);
        return IconButton(
          padding: const EdgeInsets.all(AppPadding.p8),
          onPressed: ()=> bloc.togglePasswordSecurityEyeIcon(),
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