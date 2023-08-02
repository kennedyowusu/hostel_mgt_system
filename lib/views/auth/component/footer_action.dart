import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';

class FooterAction extends StatelessWidget {
  const FooterAction({
    super.key,
    required this.question,
    required this.actionText,
    this.onPressed,
  });

  final String question, actionText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 16.0,
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5.0),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.mainBlueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
