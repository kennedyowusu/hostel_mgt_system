import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onSaved,
  });

  final String hintText;
  final IconData? prefixIcon, suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator, onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontSize: 12.0,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            suffixIcon,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            prefixIcon,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        focusColor: AppColors.primary,
        contentPadding: const EdgeInsets.only(top: 16.0),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.5),
          fontSize: 12.0,
        ),
      ),
    );
  }
}
