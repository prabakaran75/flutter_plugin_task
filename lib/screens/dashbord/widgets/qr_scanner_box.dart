import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScannerBox extends StatelessWidget {
  final double width;
  final double height;
  final String qrData;

  const QrScannerBox({
    super.key,
    required this.width,
    required this.height,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: width * 0.9,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}


// class QrScannerBox extends StatelessWidget {
//   const QrScannerBox({
//     super.key,
//     required this.width,
//     required this.height,
//   });

//   final double width;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: width * 0.28,
//       right: width * 0.28,
//       top: height * 0.2,
//       child: Container(
//         height: height * 0.25,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(
//           Icons.qr_code_2_sharp,
//           size: 130,
//           color: AppColors.secondaryColor,
//         ),
//       ),
//     );
//   }
// }