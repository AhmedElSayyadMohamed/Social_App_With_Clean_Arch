import 'package:flutter/material.dart';

class TextStyleManager {

 static get lightTextStyle => const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w300,
  fontSize: 14,
  );
 static get semiTextStyle => const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 18,
  );
 static get boldTextStyle => const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  );

}