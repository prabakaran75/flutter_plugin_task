import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';

class CustomTextformField extends StatelessWidget {
  final TextEditingController ctrl;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  const CustomTextformField({
    super.key,
    required this.ctrl,
    this.maxLength, // Optional max length
    this.keyboardType, // Optional keyboard type
    this.onChanged, // Optional onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryColor,
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
