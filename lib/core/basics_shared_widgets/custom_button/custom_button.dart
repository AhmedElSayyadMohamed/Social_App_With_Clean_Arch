import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final double borderRadius;
  final Color buttonColor;
  final Color borderColor;
  final String buttonLabel;
  final Color textColor;
  final bool addGoogleLogo;
  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 55,
    required this.onTap,
    this.borderRadius = 0,
    this.buttonColor = Colors.blue,
    this.borderColor = Colors.white,
    required this.buttonLabel,
    this.textColor = Colors.white,
    this.addGoogleLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadiusDirectional.circular(borderRadius),
          border: Border.all(width: 1, color: borderColor)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: onTap,
        child: addGoogleLogo
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/google_logo.png",
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    buttonLabel,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                  )
                ],
              )
            : Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
