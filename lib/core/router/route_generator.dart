import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/core/router/undefine_route.dart';
import 'package:social_app/feature/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:social_app/feature/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:social_app/feature/layout_screen.dart';

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.authenticationRoute:
        {
          if (FirebaseAuth.instance.currentUser != null) {
            return MaterialPageRoute(builder: (_) => const LayoutScreen());
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
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );

      default:
        return UnDefinedRoute.undefinedRoute();
    }
  }
}
