import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/screens/login_screen/widget/login_screen_body/login_screen_body.dart';
import '../../../../../utils/images_manager/images_manager.dart';
import '../../../../../utils/service_locator/service_locator.dart';
import '../../business_logic/login_bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<LoginBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                ImagesManager.loginImage,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: LoginScreenBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
