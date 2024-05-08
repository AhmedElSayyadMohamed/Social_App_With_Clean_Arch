import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final String buttonLabel;
  final VoidCallback onTap;
  final Color textColor;

  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.buttonLabel,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        buttonLabel,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: textColor),
      ),
    );
  }
}
