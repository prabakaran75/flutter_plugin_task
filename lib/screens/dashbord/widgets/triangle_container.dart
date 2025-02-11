import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';

class TriangleContainerScreen extends StatelessWidget {
  final double width;
  final double height;
  final int val;
  const TriangleContainerScreen({
    super.key,
    required this.width,
    required this.height,
    required this.val,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      left: width * 0.2,
      right: width * 0.2,
      top: height * 0.4,
      child: Stack(
        children: [
          Container(
            height: height * 0.28,
            width: width * 0.6,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 27, 27, 27),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          // Triangle Overlay Covering Three Sides
          Positioned(
            child: CustomPaint(
              size: Size(width * 0.6, height * 0.28),
              painter: RoundedTrianglePainter(),
            ),
          ),
          SizedBox(
            height: height * 0.28,
            width: width * 0.6,
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
        ],
      ),
    );
  }
}

// Custom Painter for the Triangle with Rounded Corners
class RoundedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    double borderRadius = 20.0; // Adjust for smoothness

    // Start at Bottom-Right with Rounded Corner
    path.moveTo(size.width - borderRadius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - borderRadius);

    // Move to Top-Right with Rounded Corner
    path.lineTo(size.width, borderRadius);
    path.quadraticBezierTo(size.width, 0, size.width - borderRadius, 0);

    // Move to Top-Left with Rounded Corner
    path.lineTo(borderRadius, 0);
    path.quadraticBezierTo(0, 0, 0, borderRadius);

    // Move to Bottom-Right with Rounded Corner
    path.lineTo(size.width - borderRadius, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
