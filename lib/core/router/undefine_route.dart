
import 'package:flutter/material.dart';

import '../../feature/undefine_route.dart';

class UnDefinedRoute{

  static Route<dynamic> undefinedRoute() {

    return MaterialPageRoute(
        builder: (_) => const UndefinedRouteScreen()
    );
  }
}