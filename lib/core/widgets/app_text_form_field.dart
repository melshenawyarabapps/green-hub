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

  final int maxLines;
  final int minLines;

  final double? radius;

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
    this.enabled = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        onTap: onTap,
        maxLines: maxLines,
        minLines: minLines,
        enabled: enabled,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLength: maxLength,
        style: theme.textTheme.bodySmall,
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border:
              radius != null
                  ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: BorderSide(
                      color:
                          theme.inputDecorationTheme.border?.borderSide.color ?? Colors.transparent,
                    ),
                  )
                  : theme.inputDecorationTheme.border,
          enabledBorder:
              radius != null
                  ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  )
                  : theme.inputDecorationTheme.enabledBorder,
          focusedBorder:
              radius != null
                  ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: BorderSide(
                      color:
                          theme.inputDecorationTheme.focusedBorder?.borderSide.color ??
                          theme.primaryColor,
                    ),
                  )
                  : theme.inputDecorationTheme.focusedBorder,
          errorBorder:
              radius != null
                  ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: BorderSide(
                      color: theme.inputDecorationTheme.errorBorder?.borderSide.color ?? Colors.red,
                    ),
                  )
                  : theme.inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              radius != null
                  ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius!),
                    borderSide: BorderSide(
                      color:
                          theme.inputDecorationTheme.focusedErrorBorder?.borderSide.color ??
                          Colors.red,
                    ),
                  )
                  : theme.inputDecorationTheme.focusedErrorBorder,
          prefixIconConstraints:
              prefixWidth == null ? null : BoxConstraints(maxWidth: prefixWidth!),
          counterText: maxLength != null ? '' : null,
        ),
      ),
    );
  }
}
