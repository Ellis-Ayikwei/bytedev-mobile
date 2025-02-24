import 'package:bytedev/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final TextStyle? textStyle;
  final OutlinedBorder? shape;
  final TextStyle? buttonTextStyle;
  final double? width;

  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.isOutlined = false,
      this.textStyle,
      this.shape,
      this.width,
      this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: isOutlined
            ? TextButton.styleFrom(
                side: BorderSide(color: colors.primary),
                backgroundColor: Colors.transparent,
                foregroundColor: colors.primary, // Text color for outlined button
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
              )
            : TextButton.styleFrom(
                backgroundColor:
                    AppTheme.primary, // Deep Blue background for filled
                foregroundColor:
                    Colors.white, // White text color for filled button
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
              ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white, // White progress indicator
              )
            : Text(text,
                style: buttonTextStyle ??
                    TextStyle(
                      color: isOutlined ? colors.primary : Colors.white,
                      fontSize: 16,
                    )),
      ),
    );
  }
}

