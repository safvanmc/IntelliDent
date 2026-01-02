import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelli_dent/core/constants/app_colors.dart';

/// Reusable authentication text field widget
class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            contentPadding: EdgeInsets.all(8),
            errorText: errorText,
            errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
