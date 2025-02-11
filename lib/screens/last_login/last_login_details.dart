import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/common/widgets/background_circle.dart';
import 'package:flutter_plugin_task/common/widgets/custom_button.dart';
import 'package:flutter_plugin_task/common/widgets/main_container.dart';
import 'package:flutter_plugin_task/common/widgets/title_card.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';
import 'package:flutter_plugin_task/screens/last_login/widgets/tabbar_view_data.dart';
import 'package:intl/intl.dart';

class LastLoginDetails extends StatefulWidget {
  const LastLoginDetails(this.user, {super.key});
  final User user;

  @override
  State<LastLoginDetails> createState() => _LastLoginDetailsState();
}

class _LastLoginDetailsState extends State<LastLoginDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          backgroundCircle(height: height, width: width),
          Positioned(
            left: 0,
            top: height * 0.01,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
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
            text: 'LAST LOGIN',
          ),
          Positioned(
            left: width * 0.06,
            right: width * 0.06,
            top: height * 0.2,
            child: TabBarViewData(height: height, width: width, user:widget.user),
          ),
          Positioned(
            left: width * 0.06,
            right: width * 0.06,
            bottom: height * 0.1,
            child: CustomButton(
              height: height,
              width: width,
              text: "Save",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

