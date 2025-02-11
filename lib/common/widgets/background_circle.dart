import 'package:flutter/material.dart';

class backgroundCircle extends StatelessWidget {
  const backgroundCircle({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -10,
      top: -30,
      child: Container(
        height: height * 0.2,
        width: width * 0.3,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white24),
      ),
    );
  }
}