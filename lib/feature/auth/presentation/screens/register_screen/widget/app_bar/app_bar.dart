import 'package:flutter/material.dart';

import '../../../../../../../core/router/routing_name.dart';

registerAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamed(context, Routes.loginRoute),
      icon: Icon(
        Icons.arrow_back,
        color: Colors.grey[600],
      ),
    ),
  );
}