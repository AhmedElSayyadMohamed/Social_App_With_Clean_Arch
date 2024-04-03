import 'package:flutter/material.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';

class AuthenticationTitleWidget extends StatelessWidget{
  final String screenName;
  const AuthenticationTitleWidget({super.key, required this.screenName});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          screenName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          StringsManager.appTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color:Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}