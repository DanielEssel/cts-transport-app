// widgets/buttons/secondary_button.dart

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? textColor;
  final bool isDisabled;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 56,
    this.borderColor = AppColors.primaryColor,
    this.textColor = AppColors.primaryColor,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isDisabled ? AppColors.textDisabledColor : borderColor!,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonLarge.copyWith(
            color: isDisabled ? AppColors.textDisabledColor : textColor,
          ),
        ),
      ),
    );
  }
}