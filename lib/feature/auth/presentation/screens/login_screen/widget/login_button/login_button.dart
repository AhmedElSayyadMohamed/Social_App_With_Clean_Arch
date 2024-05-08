import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/basics_shared_widgets/flutter_toast/flutter_toast.dart';
import 'package:social_app/feature/auth/presentation/business_logic/login_bloc/login_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/login_bloc/login_states.dart';
import 'package:social_app/utils/app_border/app_border.dart';
import '../../../../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../../../../core/router/routing_name.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';

class LoginButton extends StatelessWidget {
  final void Function() onTap;

  const LoginButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginErrorState) {
          Alarm.flutterToast(
            massage: state.error,
            toastState: ToastState.error,
          );
        }
        else if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.layoutRoute, (_) => false,
          );
        }
      },
      builder: (BuildContext context, LoginStates state) {
        if (state is LoginLoadingState) {
          return const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        } else {
          return CustomButton(
            onTap: onTap,
            buttonLabel: StringsManager.signIn,
            borderRadius: AppBorder.b12,
          );
        }
      },
    );
  }
}
