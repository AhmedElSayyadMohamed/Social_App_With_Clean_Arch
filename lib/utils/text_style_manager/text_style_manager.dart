import 'package:flutter/material.dart';

class TextStyleManager {

 static get lightTextStyle => const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 16,
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