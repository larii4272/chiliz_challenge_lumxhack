import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool isSecret;
  const CustomTextFieldWidget(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.isSecret});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isSecret,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        filled: true,
        hintText: hintText,
        fillColor: Colors.white,
      ),
    );
  }
}
