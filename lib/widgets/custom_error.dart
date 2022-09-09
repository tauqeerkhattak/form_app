import 'package:flutter/material.dart';
import 'package:form_app/utils/app_colors.dart';
import 'package:form_app/utils/assets.dart';
import 'package:form_app/widgets/custom_text.dart';
import 'package:form_app/widgets/widgets_uril.dart';

class CustomError extends StatelessWidget {
  final String errorText;
  final Function()? onTap;

  const CustomError({
    super.key,
    required this.errorText,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.error,
          width: 150,
          height: 150,
        ),
        WidgetsUtil.spaceV20,
        CustomText(
          text: errorText,
          color: AppColors.primary,
          size: 16,
        ),
        WidgetsUtil.spaceV20,
        if (onTap != null)
          ElevatedButton(
            onPressed: onTap!,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.primary,
              ),
            ),
            child: const CustomText(
              text: 'Try again',
              color: AppColors.white,
            ),
          ),
      ],
    );
  }
}
