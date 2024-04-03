import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/register_bloc/register_bloc.dart';
import 'package:social_app/feature/auth/presentation/screens/register_screen/widget/app_bar/app_bar.dart';
import 'package:social_app/feature/auth/presentation/screens/register_screen/widget/register_screen_body/register_screen_body.dart';
import '../../../../../utils/service_locator/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<RegisterBloc>(),
      child: Scaffold(
          appBar: registerAppBar(context),
          body: const RegisterScreenBody(),
        ),
    );
  }
}

