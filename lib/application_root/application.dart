import 'package:flutter/material.dart';
import '../core/router/route_generator.dart';
import '../core/router/routing_name.dart';
import '../core/theme/light_mode_theme.dart';
import '../utils/strings_manager/strings_manager.dart';


class SocialApp extends StatelessWidget {
  
  static const SocialApp _instance = SocialApp._internal();
  factory SocialApp() => _instance;
  const SocialApp._internal();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringsManager.appTitle,
        theme: lightMode,
        onGenerateRoute: RoutGenerator.getRoute,
        initialRoute:Routes.authenticationRoute,
    );
  }
}
