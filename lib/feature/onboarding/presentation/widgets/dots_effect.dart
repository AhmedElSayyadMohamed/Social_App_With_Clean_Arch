import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

SlideEffect dotsEffect(context){
  return SlideEffect(
      spacing:  8.0,
      radius:  15.0,
      dotWidth:  24.0,
      dotHeight:  16.0,
      paintStyle:  PaintingStyle.stroke,
      dotColor:  Colors.grey,
      activeDotColor:  Theme.of(context).primaryColor,
  );
}