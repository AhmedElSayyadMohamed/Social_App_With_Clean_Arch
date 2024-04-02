
import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  // Get the screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Get the screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // Check if the screen is in landscape mode
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  // Check if the screen is in portrait mode
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  // Get the width percentage of the screen
  double widthPercent(double percent) => screenWidth * (percent / 100.0);

  // Get the height percentage of the screen
  double heightPercent(double percent) => screenHeight * (percent / 100.0);
}
