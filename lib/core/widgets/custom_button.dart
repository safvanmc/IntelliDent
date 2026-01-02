import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;

  final Widget? widget;

  final VoidCallback? onPressed;

  final ButtonVariant variant;

  final bool isLoading;

  final bool isEnabled;

  final double? width;

  final double? height;

  final IconData? icon;

  final Color? backgroundColor;

  final Color? textColor;

  final double borderRadius;

  final double fontSize;

  final FontWeight fontWeight;

  final double horizontalPadding;

  final double verticalPadding;

  const CustomButton({
    super.key,
    this.text,
    this.widget,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !isEnabled || isLoading || onPressed == null;

    final Color bgColor = backgroundColor ?? _getBackgroundColor();
    final Color fgColor = textColor ?? _getTextColor();
    final Color disabledBgColor = AppColors.border;
    final Color disabledFgColor = AppColors.textSecondary;

    Widget buttonContent = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == ButtonVariant.primary
                    ? Colors.white
                    : AppColors.primary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon,
                    size: 20, color: isDisabled ? disabledFgColor : fgColor),
                const SizedBox(width: 8),
              ],
              if (widget != null)
                widget!
              else if (text != null)
                Text(
                  text!,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: isDisabled ? disabledFgColor : fgColor,
                  ),
                ),
            ],
          );

    final ButtonStyle buttonStyle = _getButtonStyle(
      bgColor: isDisabled ? disabledBgColor : bgColor,
      fgColor: isDisabled ? disabledFgColor : fgColor,
    );

    Widget button = variant == ButtonVariant.outlined
        ? OutlinedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: buttonContent,
          )
        : ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: buttonContent,
          );

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: button,
      );
    }

    return button;
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary;
      case ButtonVariant.secondary:
        return AppColors.secondary;
      case ButtonVariant.outlined:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
        return Colors.white;
      case ButtonVariant.outlined:
        return AppColors.textPrimary;
    }
  }

  ButtonStyle _getButtonStyle({
    required Color bgColor,
    required Color fgColor,
  }) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(bgColor),
      foregroundColor: WidgetStateProperty.all(fgColor),
      elevation:
          WidgetStateProperty.all(variant == ButtonVariant.outlined ? 0 : 2),
      shadowColor: WidgetStateProperty.all(AppColors.shadow),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: variant == ButtonVariant.outlined
              ? BorderSide(color: AppColors.border, width: 1)
              : BorderSide.none,
        ),
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

/// Button style variants
enum ButtonVariant {
  primary,

  secondary,

  outlined,
}
