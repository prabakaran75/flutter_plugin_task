import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/common/widgets/background_circle.dart';
import 'package:flutter_plugin_task/common/widgets/custom_button.dart';
import 'package:flutter_plugin_task/common/widgets/main_container.dart';
import 'package:flutter_plugin_task/common/widgets/title_card.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';
import 'package:flutter_plugin_task/screens/dashbord/widgets/qr_scanner_box.dart';
import 'package:flutter_plugin_task/screens/last_login/last_login_details.dart';
import 'package:flutter_plugin_task/screens/dashbord/widgets/triangle_container.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rn;
  void randomNumber() {
    Random random = Random();
    setState(() {
      rn = 100000 + random.nextInt(900000);
      print("Generated OTP: $rn");
    });
  }

  @override
  void initState() {
    randomNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String lastSignInTime = DateFormat("hh a")
        .format(widget.user.metadata.lastSignInTime!.toLocal());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            backgroundCircle(height: height, width: width),
            Positioned(
              right: width * 0.03,
              top: height * 0.03,
              child: Text(
                "LogOut",
                style: TextStyle(color: Colors.white),
              ),
            ),
            mainContainerBox(
              height: height,
              width: width,
            ),
            titleCards(
              height: height,
              width: width,
              text: 'PLUGIN',
            ),
            TriangleContainerScreen(
              width: width,
              height: width,
              val: rn,
            ),
            Positioned(
                left: width * 0.33,
                right: width * 0.33,
                top: height * 0.25,
                child: QrScannerBox(
                  width: width * 0.28,
                  height: height,
                  qrData: rn.toString(),
                )),
            Positioned(
              left: width * 0.06,
              right: width * 0.06,
              bottom: height * 0.02,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LastLoginDetails(widget.user),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.08,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          "Last login at Today, ${lastSignInTime}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(
                    height: height,
                    width: width,
                    text: "Save",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
