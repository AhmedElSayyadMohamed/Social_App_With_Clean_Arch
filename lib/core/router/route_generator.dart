import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/core/router/undefine_route.dart';
import 'package:social_app/feature/auth/domain/entities/user.dart';
import 'package:social_app/feature/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:social_app/feature/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:social_app/feature/layout/presentation/screen/layout_screen.dart';

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.authenticationRoute:
        {
          if (FirebaseAuth.instance.currentUser != null) {
            final UserEntity user = setting.arguments as UserEntity;

            return MaterialPageRoute(builder: (_) => LayoutScreen(user:user));
          } else {
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          }
        }
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.layoutRoute:
        {
          final UserEntity user = setting.arguments as UserEntity;

          return MaterialPageRoute(
            builder: (_) => LayoutScreen(user: user,),
          );
        }

      default:
        return UnDefinedRoute.undefinedRoute();
    }
  }
}
