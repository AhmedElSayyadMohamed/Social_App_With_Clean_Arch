import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/text_style_manager/text_style_manager.dart';

Color primaryColor = Colors.blue;
Color iconColor = Colors.grey;

ThemeData lightMode = ThemeData(

  primaryColor: primaryColor,
  iconTheme:  IconThemeData(
    color: iconColor,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: iconColor,
    ),
    backgroundColor: Colors.grey[50],
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[50],
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyleManager.boldTextStyle,
    titleMedium: TextStyleManager.semiTextStyle,
    bodyMedium: TextStyleManager.semiTextStyle,
    bodySmall: TextStyleManager.lightTextStyle,
  ),

);
