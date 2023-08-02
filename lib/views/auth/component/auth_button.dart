import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.width,
    this.onPressed,
    required this.text,
  });

  final double width;
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(
          width,
          50.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 70.0,
          vertical: 18.0,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
