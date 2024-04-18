import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/router/route_generator.dart';
import '../core/router/routing_name.dart';
import '../core/theme/light_mode_theme.dart';
import '../feature/layout/presentation/bussiness_logic/social_bloc.dart';
import '../feature/profile/presentation/business_logic/profile_bloc.dart';
import '../utils/service_locator/service_locator.dart';
import '../utils/strings_manager/strings_manager.dart';

class SocialApp extends StatelessWidget {
  static const SocialApp _instance = SocialApp._internal();
  factory SocialApp() => _instance;
  const SocialApp._internal();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocialBloc>(
          create: (BuildContext context) => sl<SocialBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProfileBloc>()
            ..add(GetUserDataEvent(FirebaseAuth.instance.currentUser!.uid)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringsManager.appTitle,
        theme: lightMode,
        onGenerateRoute: RoutGenerator.getRoute,
        initialRoute: Routes.authenticationRoute,
      ),
    );
  }
}
