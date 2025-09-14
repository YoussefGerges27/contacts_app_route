import 'package:contacts/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormfeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String value) onChange;

  const CustomTextFormfeild({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.lightBlue,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
      ),
    );
  }
}
