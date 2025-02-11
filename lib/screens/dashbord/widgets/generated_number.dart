import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';

class GeneratedNumber extends StatelessWidget {
  const GeneratedNumber({
    super.key,
    required this.width,
    required this.height, required this.val,
  });

  final double width;
  final double height;
  final int val;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: width * 0.2,
      right: width * 0.2,
      top: height * 0.4,
      child: Container(
        height: height * 0.2,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Generated number",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "$val",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
