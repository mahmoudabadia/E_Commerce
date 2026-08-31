import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

mixin DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingText,
    Color? backgroundColor,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.greenColor),
              SizedBox(width: 20),
              Text(loadingText, style: AppTextStyles.semiBold18White),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = "",
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    Color? backgroundColor,
  }) {
    List<Widget> actions = [];

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            negAction?.call();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.redColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(negActionName, style: AppTextStyles.semiBold18White),
          ),
        ),
      );
    }

    if (posActionName != null && negActionName != null) {
      actions.add(const SizedBox(width: 15));
    }

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            posAction?.call();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.orangeColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(posActionName, style: AppTextStyles.semiBold18White),
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor ?? AppColors.blackColor,
          content: Text(message, style: AppTextStyles.semiBold18White),
          title: Text(title, style: AppTextStyles.semiBold18White),
          actionsAlignment: MainAxisAlignment.center,
          actions: actions,
        );
      },
    );
  }
}
