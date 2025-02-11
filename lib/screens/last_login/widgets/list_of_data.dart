import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_task/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class ListOfData extends StatelessWidget {
  const ListOfData({
    super.key,
    required this.height,
    required this.width,
    required this.user,
  });

  final double height;
  final double width;
  final User user;

  @override
  Widget build(BuildContext context) {
    String lastSignInTime =
        DateFormat("hh:mm a").format(user.metadata.lastSignInTime!.toLocal());
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.01,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.01,
            ),
            height: height * 0.1,
            width: width,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lastSignInTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "IP: 000.000.000.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "Chennai",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.09,
                  width: width * 0.16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code_2_sharp,
                      size: 40,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
