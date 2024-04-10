import 'package:flutter/material.dart';
import 'package:social_app/feature/feeds/presentation/screens/feeds_screen.dart';
import 'package:social_app/utils/strings_manager/strings_manager.dart';

List<String> screensTitles = [
  StringsManager.layoutTitle,
  'Search',
  'Add Post',
  'Notifications',
  'Settings'
];
List<Widget> screens = [
  const FeedsScreen(),
  Container(),
  Container(),
  Container(),
  Container(),
];