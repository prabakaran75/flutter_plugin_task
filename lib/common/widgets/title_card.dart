import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';

class titleCards extends StatelessWidget {
  const titleCards({
    super.key,
    required this.height,
    required this.width,
    required this.text,
  });

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.11,
      left: width * 0.33,
      right: width * 0.33,
      child: Container(
        height: height * 0.04,
        decoration: BoxDecoration(
          color: AppColors.titleCardColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
