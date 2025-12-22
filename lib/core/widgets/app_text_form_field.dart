import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLength;
  final double? prefixWidth;
  final bool enabled;

  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.prefixWidth,
    this.enabled=true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      enabled: enabled,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      style: theme.textTheme.bodySmall,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints:
            prefixWidth ==null?null: BoxConstraints(
          maxWidth: prefixWidth!
        ),
        counterText: maxLength != null ? '' : null, // Hide counter
      ),
    );
  }
}
