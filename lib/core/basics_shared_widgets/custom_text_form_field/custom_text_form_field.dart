import 'package:flutter/material.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';


class CustomTextFormField extends StatelessWidget {
  final String? textFormLabel;
  final TextInputType keyboardType;
  final double formBorderRadius;
  final bool obSecureText;
  final Color? borderColor;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool expand;
  final bool isBorder;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.textFormLabel = "",
    required this.keyboardType,
    this.obSecureText = false,
    this.formBorderRadius = 0,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.hint,
    this.onFieldSubmitted,
    this.expand = false,
    this.isBorder = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obSecureText,
      minLines: expand ? null : 1,
      maxLines: expand ? null : 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(AppPadding.p16),
        isCollapsed: true,
        label: Text(
          textFormLabel!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        border: isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(formBorderRadius),
              )
            : InputBorder.none,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
