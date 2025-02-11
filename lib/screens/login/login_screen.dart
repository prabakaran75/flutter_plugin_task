import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/background_circle.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/main_container.dart';
import '../../../common/widgets/title_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../services/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            backgroundCircle(height: height, width: width),
            mainContainerBox(height: height, width: width),
            titleCards(height: height, width: width, text: 'LOGIN'),
            Positioned(
              left: width * 0.06,
              right: width * 0.06,
              top: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone number", style: TextStyle(color: Colors.white)),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: authProvider.phoneCtrl,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    onChanged: (v) {
                      if(v.isNotEmpty){
                        if(v.length == 10){
                          String phoneNumber =
                              '+91${authProvider.phoneCtrl.text.trim()}';
                          authProvider.sendOTP(phoneNumber);
                        }
                      }
                    },
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
                  ),
                  SizedBox(height: height * 0.06),
                  if (authProvider.isOTPSent) ...[
                    Text("OTP", style: TextStyle(color: Colors.white)),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      controller: authProvider.otpCtrl,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {},
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
                    ),
                    SizedBox(height: height * 0.1),
                    CustomButton(
                      height: height,
                      width: width,
                      text: 'VERIFY OTP',
                      onPressed: () {
                        print(authProvider.otpCtrl.text);
                        authProvider.verifyOTP(
                            authProvider.otpCtrl.text.trim(), context);
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
